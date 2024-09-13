# terraform {
#   cloud {
#     organization = "coder4lyfe"

#     workspaces {
#       name = "backend"
#     }
#   }
# }

provider "aws" {
  region = "us-east-1"

  endpoints {
    apigateway = local.endpoint
    dynamodb   = local.endpoint
    iam        = local.endpoint
    sts        = local.endpoint
    lambda     = local.endpoint
  }
}

locals {
  endpoint   = terraform.workspace == "prod" ? "" : "http://localhost:4566"
  is_windows = length(regexall("^[a-z]:", lower(abspath(path.root)))) > 0
}

resource "null_resource" "delete_folder" {
  provisioner "local-exec" {
    command     = local.is_windows ? "rmdir /S /Q output" : "rm -rf output"
    working_dir = ".."
    when        = create
    on_failure  = continue
  }
}

resource "null_resource" "refresh_folder" {
  provisioner "local-exec" {
    command     = "mkdir output"
    working_dir = ".."
    when        = create
  }

  depends_on = [null_resource.delete_folder]
}

resource "null_resource" "build_script" {
  for_each = toset(local.foldernames)

  provisioner "local-exec" {
    command     = local.is_windows ? "build.bat" : "./build.sh"
    working_dir = "../src/${each.key}/"
  }

  triggers = {
    filechange = sha1(join("", [
      for f in fileset("../src/${each.key}", "**") : filesha1("../src/${each.key}/${f}")
    ]))
  }

  depends_on = [null_resource.refresh_folder]
}
