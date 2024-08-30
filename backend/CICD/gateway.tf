resource "aws_api_gateway_rest_api" "api" {
  name        = "DefaultAPI"
  description = "The default API to use"
}

output "deployment" {
  value = aws_api_gateway_deployment.v1.invoke_url
}