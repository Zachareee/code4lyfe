data "archive_file" "file" {
  type = "zip"
  source_file = "../output/${var.function_name}/bootstrap"
  output_path = "../output/${var.function_name}.zip"
}

resource "aws_lambda_function" "function" {
  filename         = data.archive_file.file.output_path
  function_name    = var.function_name
  role             = var.lambda_arn
  runtime          = "provided.al2023"
  handler          = "bootstrap"
  source_code_hash = data.archive_file.file.output_base64sha256
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.gateway_execution_arn}/*/*/*"
}
