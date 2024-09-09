locals {
  tables = {
    CaregiverCodePair = {
      hash_key  = "code"
      attr_name = "code"
      attr_type = "N"
    }
    CaregiverDependentPair = {
      hash_key  = "dependent"
      attr_name = "dependent"
      attr_type = "N"
    }
  }

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
    "phone" = {
      GET = {
        function_name = "get-phonenum"
        language      = "python"
        handler       = "index.lambda_handler"
      }
    }
  }

  foldernames = flatten([
    for path, methodcollection in local.paths : [
      for method, obj in methodcollection :
      obj.language
    ]
  ])
}

variable "stage_name" {
  type        = string
  description = "The name of the deployment stage on apigateway"
  default     = "local"
}
