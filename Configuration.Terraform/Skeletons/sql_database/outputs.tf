output "database_id" {
  description = "The ID of the SQL database."
  value       = azurerm_mssql_database.mssql_database.id
}

output "database_name" {
  description = "The name of the SQL database."
  value       = azurerm_mssql_database.mssql_database.name
}

output "database_collation" {
  description = "The collation of the SQL database."
  value       = azurerm_mssql_database.mssql_database.collation
}

output "database_max_size_gb" {
  description = "The maximum size of the SQL database in GB."
  value       = azurerm_mssql_database.mssql_database.max_size_gb
}

output "database_sku_name" {
  description = "The SKU name of the SQL database."
  value       = azurerm_mssql_database.mssql_database.sku_name
}

output "sql_connection_string" {
  description = "Full SQL Server connection string"
  value       = "Server=tcp:${var.server_fqdn},1433;Initial Catalog=${azurerm_mssql_database.mssql_database.name};Persist Security Info=False;User ID=${var.admin_user};Password=${var.admin_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  sensitive   = true
}
