resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.rest_api_id
  path_part   = var.path_part
  parent_id   = var.parent_id
}

resource "aws_api_gateway_method" "method" {
  for_each = var.methods

  rest_api_id   = var.rest_api_id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = each.key
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "method" {
  for_each = aws_api_gateway_method.method

  rest_api_id             = var.rest_api_id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = each.value.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"

  uri = module.lambdamods[each.key].invoke_arn
}

module "lambdamods" {
  for_each = var.methods
  source   = "../lambdamod"

  function_name         = each.value.function_name
  gateway_execution_arn = var.gateway_execution_arn
  lambda_arn            = var.lambda_arn
  lambda_role           = var.lambda_role
  language              = each.value.language
}
