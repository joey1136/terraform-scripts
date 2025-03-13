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

  azurerm_key_vault_id = var.azurerm_key_vault_id
  secret_name          = "database-admin-username"
  secret_value         = var.database_admin_username
}

module "azure_database_admin_password" {
  source = "../azure-key-vault-secret"

  azurerm_key_vault_id = var.azurerm_key_vault_id
  secret_name          = "database-admin-password"
  secret_value         = local.admin_password
}

resource "azurerm_mssql_server" "server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  administrator_login          = var.database_admin_username
  administrator_login_password = local.admin_password
  version                      = "12.0"
}

resource "azurerm_mssql_firewall_rule" "whitelist" {
  for_each = toset(var.whitelist_ip_address)

  name      = "allow-ip-${replace(each.value, ".", "-")}"
  server_id = azurerm_mssql_server.server.id

  start_ip_address = each.value
  end_ip_address   = each.value
}
