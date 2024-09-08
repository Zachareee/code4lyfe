variable "paths" {
  default = {
    register = {
      GET = {
        function_name = "get-register",
        language      = "golang"
      }
      POST = {
        function_name = "post-register",
        language      = "golang"
      }
    }
    hello = {
      GET = {
        function_name = "hello-world"
        language      = "javascript"
      }
    }
  }
}

variable "foldernames" {
  default = ["typescript", "golang"]
}