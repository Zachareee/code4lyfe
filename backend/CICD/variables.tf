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
      }
      POST = {
        function_name = "post-register"
        language      = "golang"
      }
    }
    "hello" = {
      GET = {
        function_name = "hello-world"
        language      = "typescript"
      }
    }
    "bye" = {
      GET = {
        function_name = "bye-world"
        language      = "typescript"
      }
    }
    "phone" = {
      GET = {
        function_name = "get-phonenum"
        language      = "python"
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
