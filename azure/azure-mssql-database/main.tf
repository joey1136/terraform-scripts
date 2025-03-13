
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "vault" {
  name                = var.vault_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "random_password" "database_admin_password" {
  count       = var.database_admin_password == null ? 1 : 0
  length      = 20
  special     = true
  min_numeric = 1
  min_upper   = 1
  min_lower   = 1
  min_special = 1
}

locals {
  admin_password = try(random_password.database_admin_password[0].result, var.database_admin_password)
}

module "azure_database_admin_username" {
  source = "../azure-key-vault-secret"

  resource_group_name = var.resource_group_name
  vault_name          = var.vault_name
  secret_name         = "database-admin-username"
  secret_value        = var.database_admin_username
}

module "azure_database_admin_password" {
  source = "../azure-key-vault-secret"

  resource_group_name = var.resource_group_name
  vault_name          = var.vault_name
  secret_name         = "database-admin-password"
  secret_value        = local.admin_password
}

resource "azurerm_mssql_server" "server" {
  name                         = var.database_name
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  administrator_login          = var.database_admin_username
  administrator_login_password = local.admin_password
  version                      = "12.0"
}

resource "azurerm_mssql_database" "db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.server.id
}
