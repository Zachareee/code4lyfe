output "gateway" {
  value = "http://localhost:4566/restapis/${module.apigateway.gateway}/local/_user_request_"
}
