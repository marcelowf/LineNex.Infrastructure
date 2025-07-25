output "sql_server_name" {
  description = "The name of the SQL Server."
  value       = azurerm_mssql_server.mssql_server.name
}

output "sql_server_fully_qualified_domain_name" {
  description = "The fully qualified domain name of the SQL Server."
  value       = azurerm_mssql_server.mssql_server.fully_qualified_domain_name
}

output "sql_server_administrator_login" {
  description = "The administrator login name for the SQL Server."
  value       = azurerm_mssql_server.mssql_server.administrator_login
}

output "sql_server_resource_group" {
  description = "The resource group where the SQL Server is deployed."
  value       = azurerm_mssql_server.mssql_server.resource_group_name
}

output "id" {
  description = "The ID of the SQL Server."
  value       = azurerm_mssql_server.mssql_server.id
}