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
  access_key = "access"
  secret_key = "secret"

  endpoints {
    apigateway = "http://localhost:4566"
    dynamodb   = "http://localhost:4566"
    iam        = "http://localhost:4566"
    sts        = "http://localhost:4566"
    lambda     = "http://localhost:4566"
  }
}