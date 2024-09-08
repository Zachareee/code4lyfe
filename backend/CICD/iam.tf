resource "aws_iam_role" "lambda_role" {
  name               = "exec_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_policy.json
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "dynamodb_perms" {
  statement {
    actions = [
      "dynamodb:*",
      "logs:*"
    ]

    resources = [ aws_dynamodb_table.CCP.arn ]
  }
}

resource "aws_iam_policy" "dynamodb_policy" {
  name = "dynamodb_lambda_policy"
  description = "Policy used to access dynamodb"
  policy = data.aws_iam_policy_document.dynamodb_perms.json
}

resource "aws_iam_role_policy_attachment" "attach_dynamodb_lambda" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}