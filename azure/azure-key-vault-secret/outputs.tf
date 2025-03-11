output "uri" {
  value = azurerm_key_vault_secret.secret.versionless_id
}
