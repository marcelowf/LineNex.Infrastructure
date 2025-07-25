output "vnet_id" {
  description = "ID of the created virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Name of the created virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_location" {
  description = "Location of the created virtual network"
  value       = azurerm_virtual_network.vnet.location
}

output "vnet_address_space" {
  description = "Address space of the created virtual network"
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnet_ids" {
  description = "Map of subnet names to subnet IDs"
  value       = { for subnet in azurerm_virtual_network.vnet.subnet : subnet.name => subnet.id }
}