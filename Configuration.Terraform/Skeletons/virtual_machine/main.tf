locals {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size
  network_interface_ids = var.network_interface_ids
  admin_username        = var.admin_username
}

resource "tls_private_key" "vm_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                  = local.name
  resource_group_name   = local.resource_group_name
  location              = local.location
  size                  = local.size
  admin_username        = local.admin_username
  network_interface_ids = local.network_interface_ids

  admin_ssh_key {
    username   = local.admin_username
    public_key = tls_private_key.vm_ssh.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
