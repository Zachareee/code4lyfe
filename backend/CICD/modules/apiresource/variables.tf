variable "path_part" {
  type = string
}

variable "rest_api_id" {
  type = string
}

variable "parent_id" {
  type = string
}

variable "methods" {
  type = map(object({
    function_name = string
    language      = string
  }))
}

variable "gateway_execution_arn" {
  type = string
}

variable "lambda_arn" {
  type = string
}

variable "lambda_role" {
  type = string
}

#variable "lambda_layers" {
#  type = list(string)
#}
