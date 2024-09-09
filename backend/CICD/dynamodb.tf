resource "aws_dynamodb_table" "CCP" {
  for_each = local.tables

  name     = each.key
  hash_key = each.value.hash_key

  attribute {
    name = each.value.attr_name
    type = each.value.attr_type
  }

  billing_mode = "PAY_PER_REQUEST"
}
