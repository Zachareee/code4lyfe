resource "aws_api_gateway_rest_api" "api" {
  name        = "DefaultAPI"
  description = "The default API to use"
}

resource "aws_api_gateway_deployment" "v1" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "local"
  depends_on  = [module.apiresources]
}

module "apiresources" {
  for_each = var.paths
  source   = "../apiresource"

  rest_api_id           = aws_api_gateway_rest_api.api.id
  gateway_execution_arn = aws_api_gateway_rest_api.api.execution_arn
  parent_id             = aws_api_gateway_rest_api.api.root_resource_id
  lambda_arn            = var.lambda_arn
  lambda_role           = var.lambda_role
  path_part             = each.key
  methods               = each.value
}
