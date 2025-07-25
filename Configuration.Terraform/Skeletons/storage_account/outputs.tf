output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.sa.id
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.sa.name
}

output "storage_account_primary_endpoint" {
  description = "The primary endpoint of the storage account."
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.sa.primary_access_key
  sensitive   = true
}

output "storage_account_primary_connection_string" {
  description = "Primary connection string for the storage account"
  value       = azurerm_storage_account.sa.primary_connection_string
  sensitive   = true
}
