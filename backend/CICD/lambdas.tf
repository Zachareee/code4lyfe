module "apigateway" {
  source = "./modules/apimod"

  lambda_role = aws_iam_role.lambda_role.name
  lambda_arn  = aws_iam_role.lambda_role.arn
  paths = {
    "register" : {
      "GET" : "get-register",
      "POST" : "post-register"
    }
  }

  depends_on = [null_resource.build_script]
}
