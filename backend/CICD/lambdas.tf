locals {
  paths = {
    register = {
      GET = {
        function_name = "get-register",
        language      = "golang"
      }
      POST = {
        function_name = "post-register",
        language      = "golang"
      }
    }
    hello = {
      GET = {
        function_name = "hello-world"
        language      = "javascript"
      }
    }
  }
}

module "apigateway" {
  source = "./modules/apigateway"

  lambda_role = aws_iam_role.lambda_role.name
  lambda_arn  = aws_iam_role.lambda_role.arn
  paths       = local.paths

  depends_on = [null_resource.build_script]
}
