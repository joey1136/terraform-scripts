data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "vault" {
  name                = var.vault_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_key_vault_secret" "secret" {
  key_vault_id = data.azurerm_key_vault.vault.id
  name         = var.secret_name
  value        = var.secret_value

  # lifecycle {
  #   ignore_changes = [tags, key_vault_id]
  # }
}
