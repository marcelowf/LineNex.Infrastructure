locals {
  name         = var.sql_database_name
  server_id    = var.server_id
  collation    = var.collation
  max_size_gb  = var.max_size_gb
  sku_name     = var.sku_name
  enclave_type = var.enclave_type
  tags         = var.tags
}

resource "azurerm_mssql_database" "mssql_database" {
  name         = local.name
  server_id    = local.server_id
  collation    = local.collation
  max_size_gb  = local.max_size_gb
  sku_name     = local.sku_name
  enclave_type = local.enclave_type
  tags         = local.tags

  lifecycle {
    prevent_destroy = false
  }
}
