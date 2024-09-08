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
  endpoint = terraform.workspace == "prod" ? "" : "http://localhost:4566"
}
