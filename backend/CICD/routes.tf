
# resource "aws_api_gateway_method" "post_register" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.register.id
#   http_method   = "POST"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "post_register" {
#   rest_api_id             = aws_api_gateway_rest_api.api.id
#   resource_id             = aws_api_gateway_resource.register.id
#   http_method             = aws_api_gateway_method.post_register.http_method
#   integration_http_method = aws_api_gateway_method.post_register.http_method
#   type                    = "AWS"

#   uri = module.getregister["POST"].invoke_arn
# }