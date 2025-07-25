output "id" {
  description = "The ID of the Azure App Service."
  value       = azurerm_linux_web_app.web_app.id
}

output "principal_id" {
  description = "The principal ID of the system-assigned managed identity."
  value       = try(azurerm_linux_web_app.web_app.identity[0].principal_id, null)
}

output "app_service_name" {
  description = "The name of the App Service"
  value = azurerm_linux_web_app.web_app.name
}
