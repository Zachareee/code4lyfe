output "gateway" {
  value = terraform.workspace == "prod" ? aws_api_gateway_deployment.v1.invoke_url : "https://${aws_api_gateway_rest_api.api.id}.execute-api.localhost.localstack.cloud:4566/${aws_api_gateway_deployment.v1.stage_name}/"
}
