variable "resource_group_location" {
  type        = string
  default     = "eastasia"
  description = "Location of the resource group."
}

# variable "resource_group_name_prefix" {
#   type        = string
#   default     = "rg"
#   description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
# }

variable "resource_group_name" {
  type        = string
  default     = "azure-resource-group"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = "azure-vault-name"
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = "azure-vault-key-name"
}

variable "database_admin_username" {
  type    = string
  default = "azureadmin"
}

variable "database_admin_password" {
  type    = string
  default = ""
}
variable "mssql_server_name" {
  type    = string
  default = "azure-server-mssql"
}

variable "mssql_db_name" {
  type    = string
  default = "azure-database-mssql"
}

variable "whitelist_ip_address" {
  type    = list(string)
  default = []
}
