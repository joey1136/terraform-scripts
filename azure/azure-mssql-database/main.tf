resource "azurerm_mssql_database" "database" {
  name      = var.mssql_db_name
  server_id = var.server_id

  sku_name    = var.size.sku_name
  max_size_gb = var.size.max_size_gb

  collation = var.collation
}
