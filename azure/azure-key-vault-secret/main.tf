resource "azurerm_key_vault_secret" "secret" {
  key_vault_id = var.azurerm_key_vault_id
  name         = var.secret_name
  value        = var.secret_value

  # lifecycle {
  #   ignore_changes = [tags, key_vault_id]
  # }
}
