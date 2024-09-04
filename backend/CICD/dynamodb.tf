resource "aws_dynamodb_table" "CCP" {
  name     = "CaregiverCodePair"
  hash_key = "code"

  attribute {
    name = "code"
    type = "N"
  }

  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_dynamodb_table" "CDP" {
  name     = "CaregiverDependentPair"
  hash_key = "dependent"

  attribute {
    name = "dependent"
    type = "N"
  }

  billing_mode = "PAY_PER_REQUEST"
}