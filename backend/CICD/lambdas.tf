locals {
  is_windows = length(regexall("^[a-z]:", lower(abspath(path.root)))) > 0
}

resource "null_resource" "refresh_folder" {
  provisioner "local-exec" {
    command     = local.is_windows ? "rmdir /S /Q output && mkdir output" : "rm -rf output; mkdir output"
    working_dir = ".."
    when        = create
  }
}

resource "null_resource" "build_script" {
  for_each = toset(local.foldernames)

  provisioner "local-exec" {
    command     = local.is_windows ? "build.bat" : "./build.sh"
    working_dir = "../src/${each.key}/"
  }

  triggers = {
    filechange = sha1(join("", [
      for f in fileset("../src/${each.key}", "**") : filesha1("../src/${each.key}/${f}")
    ]))
  }

  depends_on = [null_resource.refresh_folder]
}

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
  for_each = local.paths
  source   = "./modules/apiresource"

  rest_api_id           = aws_api_gateway_rest_api.api.id
  gateway_execution_arn = aws_api_gateway_rest_api.api.execution_arn
  parent_id             = aws_api_gateway_rest_api.api.root_resource_id
  lambda_role           = aws_iam_role.lambda_role.name
  lambda_arn            = aws_iam_role.lambda_role.arn
  path_part             = each.key
  methods               = each.value

  depends_on = [null_resource.build_script]
}
