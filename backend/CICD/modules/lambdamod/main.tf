resource "aws_lambda_function" "function" {
  filename      = var.zip_file
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  runtime       = "provided.al2023"
  handler       = "bootstrap"
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.api.execution_arn}/*/*/*"
}