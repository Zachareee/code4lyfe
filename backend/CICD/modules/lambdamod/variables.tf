variable "function_name" {
  type        = string
  description = "The name of the lambda function"
}

variable "handler" {
  type        = string
  description = "The handler name"
}

variable "gateway_execution_arn" {
  type        = string
  description = "Execution ARN of gateway rest api"
}

variable "lambda_role" {
  type        = string
  description = "Lambda role name"
}

variable "lambda_arn" {
  type        = string
  description = "Lambda arn"
}

variable "language" {
  type        = string
  description = "Language used"
}
