module "getregister" {
  source = "./modules/lambdamod"

  function_name         = "get-register"
  gateway_execution_arn = aws_api_gateway_rest_api.api.execution_arn
  lambda_role           = aws_iam_role.lambda_role.name
  lambda_arn            = aws_iam_role.lambda_role.arn

  depends_on = [null_resource.build_script]
}

# module "getregister" {
#   source = "./modules/lambdamod"

#   function_name = "getregister"
#   zip_file      = "get-register.zip"
#   source_arn    = aws_api_gateway_rest_api.api.execution_arn

#   depends_on = [terraform_data.build_script]
# }
