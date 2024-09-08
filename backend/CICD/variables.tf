variable "stage_name" {
  type        = string
  description = "The name of the deployment stage on apigateway"
  default     = "local"
}

locals {
  paths = {
    "register" = {
      GET = {
        function_name = "get-register"
        language      = "golang"
        handler       = "bootstrap"
      }
      POST = {
        function_name = "post-register"
        language      = "golang"
        handler       = "bootstrap"
      }
    }
    "hello" = {
      GET = {
        function_name = "hello-world"
        language      = "typescript"
        handler       = "index.handler"
      }
    }
    "bye" = {
      GET = {
        function_name = "bye-world"
        language      = "typescript"
        handler       = "index.handler"
      }
    }
  }

  foldernames = ["typescript", "golang"]
}
