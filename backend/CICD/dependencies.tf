resource "null_resource" "build_script" {
  provisioner "local-exec" {
    command     = length(regexall("/home/", lower(abspath(path.root)))) > 0 ? "build.sh" : "build.bat"
    working_dir = ".."
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = "exec_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_policy.json
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "lambda_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = [
      "dynamodb:BatchGetItem",
      "dynamodb:GetItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:BatchWriteItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "dlpolicy" {
  name = "dynamodb_lambda_policy"
  description = "Policy used to get data"
  policy = data.aws_iam_policy_document.lambda_policy_document.json
}

resource "aws_iam_role_policy_attachment" "attach" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.dlpolicy.arn
}