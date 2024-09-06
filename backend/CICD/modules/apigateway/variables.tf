variable "paths" {
  type = map(map(object({
    function_name = string
    runtime       = string
    handler       = string
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
