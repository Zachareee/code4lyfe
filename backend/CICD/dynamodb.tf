resource "aws_dynamodb_table" "CCP" {
  name = "CaregiverCodePair"
  hash_key = "code"

  attribute {
    name = "code"
    type = "N"
  }

  billing_mode = "PAY_PER_REQUEST"
}