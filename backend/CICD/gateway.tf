resource "aws_api_gateway_rest_api" "api" {
  name        = "DefaultAPI"
  description = "The default API to use"
}

resource "aws_api_gateway_resource" "root" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "pets"
}

resource "aws_api_gateway_method" "get_root" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.root.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.root.id
  http_method             = aws_api_gateway_method.get_root.http_method
  integration_http_method = aws_api_gateway_method.get_root.http_method
  type                    = "AWS"

  uri = module.postregister.invoke_arn
}

resource "aws_api_gateway_method_response" "name" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = aws_api_gateway_method.get_root.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "name" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = aws_api_gateway_method.get_root.http_method
  status_code =  aws_api_gateway_method_response.name.status_code

  depends_on = [ aws_api_gateway_method.get_root, aws_api_gateway_integration.integration ]
}

resource "aws_api_gateway_deployment" "v1" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "local"

  depends_on = [aws_api_gateway_integration.integration]
}

output "deployment" {
  value = aws_api_gateway_deployment.v1.invoke_url
}