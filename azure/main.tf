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

module "azure_database_admin_username" {
  source = "./azure-key-vault-secret"

  resource_group_name = var.resource_group_name
  vault_name          = module.azure_key_vault.azurerm_key_vault_name
  secret_name         = "database-admin-username"
  secret_value        = var.database_admin_username
}
