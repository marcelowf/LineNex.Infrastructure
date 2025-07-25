output "id" {
  description = "The ID of the App Service Plan."
  value       = azurerm_service_plan.asp.id
}

output "name" {
  description = "The name of the App Service Plan."
  value       = azurerm_service_plan.asp.name
}

output "location" {
  description = "The location of the App Service Plan."
  value       = azurerm_service_plan.asp.location
}

output "sku" {
  description = "The SKU of the App Service Plan."
  value       = azurerm_service_plan.asp.sku_name
}