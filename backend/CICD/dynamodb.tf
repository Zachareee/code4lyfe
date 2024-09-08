resource "aws_dynamodb_table" "CCP" {
  for_each = {
    CaregiverCodePair = {
      hash_key  = "code"
      attr_name = "code"
      attr_type      = "N"
    }
    CaregiverDependentPair = {
      hash_key  = "dependent"
      attr_name = "dependent"
      attr_type = "N"
    },
  }

  name     = each.key
  hash_key = each.value.hash_key

  attribute {
    name = each.value.attr_name
    type = each.value.attr_type
  }

  billing_mode = "PAY_PER_REQUEST"
}
