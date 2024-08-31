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

data "aws_iam_policy_document" "dynamodb_policy" {
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
  }
}
