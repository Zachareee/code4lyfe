resource "aws_dynamodb_table" "CCP" {
  name     = "CaregiverCodePair"
  hash_key = "code"

  attribute {
    name = "code"
    type = "N"
  }

  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_dynamodb_resource_policy" "CCP_policy" {
  resource_arn = aws_dynamodb_table.CCP.arn
  policy       = data.aws_iam_policy_document.dynamodb_policy.json
}
