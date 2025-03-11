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
