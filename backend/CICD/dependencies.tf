resource "null_resource" "build_script" {
  provisioner "local-exec" {
    command = length(regexall("/home/", lower(abspath(path.root)))) > 0 ? "build.sh" : "build.bat"
    working_dir = ".."
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = "exec_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}