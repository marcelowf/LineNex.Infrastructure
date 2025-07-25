output "id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.kv.id
}

output "name" {
  description = "The name of the Key Vault."
  value       = azurerm_key_vault.kv.name
}
