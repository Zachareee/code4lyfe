variable "paths" {
  type = map(object({
    GET: string
    POST: string
  }))
}

variable "lambda_role" {
  type        = string
  description = "Lambda role name"
  default     = "value"
}

variable "lambda_arn" {
  type        = string
  description = "Lambda arn"
  default     = "value"
}
