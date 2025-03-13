variable "resource_group_name" {
  type        = string
  default     = "azure-resource-group"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
}

variable "database_name" {
  type = string
}

variable "database_admin_username" {
  type = string
}

variable "database_admin_password" {
  type    = string
  default = "P@ssword"
}

variable "sql_db_name" {
  type = string
}
