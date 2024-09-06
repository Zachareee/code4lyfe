variable "paths" {
  type = map(map(object({
    function_name = string
    language      = string
  })))
}

variable "lambda_role" {
  type        = string
  description = "Lambda role name"
}

variable "lambda_arn" {
  type        = string
  description = "Lambda arn"
}
