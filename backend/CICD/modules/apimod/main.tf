resource "aws_api_gateway_rest_api" "api" {
  name        = "DefaultAPI"
  description = "The default API to use"
}

# resource "aws_api_gateway_deployment" "v1" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   stage_name  = "local"
#   depends_on  = [aws_api_gateway_integration.get_register]
# }

# module "lambdamods" {
#   source   = "../lambdamod"
#   for_each = var.paths

#   function_name         = each.value
#   lambda_role           = var.lambda_role
#   lambda_arn            = var.lambda_arn
#   gateway_execution_arn = aws_api_gateway_rest_api.api.execution_arn
# }

resource "aws_api_gateway_resource" "resource" {
  for_each    = var.paths
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = each.key
}

resource "aws_api_gateway_method" "get_register" {
  for_each      = {
    for k, v in aws_api_gateway_resource.resource: k => var.paths[k]
  }
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = each.value.id
  http_method   = var.paths[each.key]
  authorization = "NONE"
}

# resource "aws_api_gateway_integration" "get_register" {
#   rest_api_id             = aws_api_gateway_rest_api.api.id
#   resource_id             = aws_api_gateway_resource.resource.id
#   http_method             = aws_api_gateway_method.get_register.http_method
#   integration_http_method = aws_api_gateway_method.get_register.http_method
#   type                    = "AWS"

#   uri = module.lambdamods.invoke_arn
# }
