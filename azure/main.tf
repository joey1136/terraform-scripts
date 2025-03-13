# resource "random_pet" "rg_name" {
#   prefix = var.resource_group_name_prefix
# }

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

module "azure_key_vault" {
  source = "./azure-key-vault"

  resource_group_location = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  vault_name              = var.vault_name
  key_name                = var.key_name
}

module "azure_mssql_server" {
  source = "./azure-mssql-server"

  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  vault_name              = module.azure_key_vault.azurerm_key_vault_name
  azurerm_key_vault_id    = module.azure_key_vault.azurerm_key_vault_id
  database_admin_username = var.database_admin_username
  server_name             = var.mssql_server_name
  whitelist_ip_address    = var.whitelist_ip_address
}

// ordering of creating azurerm_mssql_database and azurerm_mssql_server seems not ensure by terraform event refering server_id
module "azure_database" {
  source = "./azure-mssql-database"

  server_id     = module.azure_mssql_server.server_id
  mssql_db_name = var.mssql_db_name
}
