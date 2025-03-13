variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
}

variable "azurerm_key_vault_id" {
  type = string
}

variable "server_name" {
  type = string
}

variable "database_admin_username" {
  type = string
}

variable "database_admin_password" {
  type    = string
  default = "P@ssword"
}

variable "whitelist_ip_address" {
  type    = list(string)
  default = []
}
