locals {
  paths = {
    register = {
      GET = {
        function_name = "get-register",
        runtime       = "provided.al2023",
        handler       = "bootstrap",
      }
      POST = {
        function_name = "post-register",
        runtime       = "provided.al2023",
        handler       = "bootstrap",
      }
    }
  }
}

module "apigateway" {
  source = "./modules/apigateway"

  lambda_role = aws_iam_role.lambda_role.name
  lambda_arn  = aws_iam_role.lambda_role.arn
  paths = local.paths

  depends_on = [null_resource.build_script]
}
