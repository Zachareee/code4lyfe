output "methods" {
  value = {
    for k, v in aws_api_gateway_resource.resource: k => v
  }
}

output "lambdas" {
  value = {
    for k, v in aws_api_gateway_resource.resource: k => v
  }
}