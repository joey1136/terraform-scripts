# resource "random_pet" "rg_name" {
#   prefix = var.resource_group_name_prefix
# }

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

module "azure_key_vault" {
  source = "./azure-key-vault"

  resource_group_name = var.resource_group_name
  vault_name          = var.vault_name
  key_name            = var.key_name
}

module "azure_database" {
  source = "./azure-mssql-database"

  resource_group_name     = var.resource_group_name
  vault_name              = module.azure_key_vault.azurerm_key_vault_name
  database_admin_username = var.database_admin_username
  sql_db_name             = var.sql_db_name
  database_name           = var.database_name
}
