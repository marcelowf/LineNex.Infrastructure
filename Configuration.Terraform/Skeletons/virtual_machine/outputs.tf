output "vm_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm_linux.id
}

output "vm_name" {
  description = "The name of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm_linux.name
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm_linux.private_ip_address
}

output "vm_public_ip" {
  description = "The public IP address of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm_linux.public_ip_address
}