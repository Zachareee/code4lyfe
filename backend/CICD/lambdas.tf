resource "aws_api_gateway_rest_api" "api" {
  name        = "DefaultAPI"
  description = "The default API to use"
}

resource "aws_api_gateway_deployment" "v1" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = var.stage_name
  depends_on  = [module.apiresources]
}

data "archive_file" "pydeps" {
  type        = "zip"
  output_path = "../output/pydeps.zip"
  source_dir  = "../output/pydeps"

  depends_on = [null_resource.build_script]
}

resource "aws_lambda_layer_version" "python_deps" {
  layer_name = "Python dependencies"

  filename = data.archive_file.pydeps.output_path
}

module "apiresources" {
  for_each = local.paths
  source   = "./modules/apiresource"

  rest_api_id           = aws_api_gateway_rest_api.api.id
  gateway_execution_arn = aws_api_gateway_rest_api.api.execution_arn
  parent_id             = aws_api_gateway_rest_api.api.root_resource_id
  lambda_role           = aws_iam_role.lambda_role.name
  lambda_arn            = aws_iam_role.lambda_role.arn
  path_part             = each.key
  methods               = each.value
  lambda_layers         = [aws_lambda_layer_version.python_deps.arn]

  depends_on = [null_resource.build_script]
}
