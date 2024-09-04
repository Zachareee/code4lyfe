resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.rest_api_id
  path_part   = var.path_part
  parent_id   = var.parent_id
}
