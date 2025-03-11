variable "resource_group_name" {
  type = string
}

variable "vault_name" {
  type        = string
  description = "The name of the existing key vault."
}

variable "secret_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
}

variable "secret_value" {
  type = string
}
