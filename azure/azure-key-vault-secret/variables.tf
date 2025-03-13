variable "azurerm_key_vault_id" {
  type = string
}

variable "secret_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
}

variable "secret_value" {
  type = string
}
