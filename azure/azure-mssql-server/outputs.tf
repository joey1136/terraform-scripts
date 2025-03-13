output "sql_server_name" {
  value = azurerm_mssql_server.server.name
}

output "server_id" {
  value = azurerm_mssql_server.server.id
}

output "admin_password" {
  sensitive = true
  value     = local.admin_password
}
