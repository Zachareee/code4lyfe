data "archive_file" "file" {
  type        = "zip"
  source_dir  = "../output/${var.function_name}"
  output_path = "../output/${var.function_name}.zip"
}

resource "aws_lambda_function" "function" {
  filename         = data.archive_file.file.output_path
  function_name    = var.function_name
  role             = var.lambda_arn
  runtime          = local.config[var.language].runtime
  handler          = local.config[var.language].handler
  source_code_hash = data.archive_file.file.output_base64sha256
  #layers           = var.lambda_layers
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.gateway_execution_arn}/*/*/*"
}
