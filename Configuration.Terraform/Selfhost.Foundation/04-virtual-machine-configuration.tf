locals {
  install_agent_sas_token = data.azurerm_storage_account_sas.self-host-scripts.sas
  install_script_url      = "https://${module.sa-01.storage_account_name}.blob.core.windows.net/${azurerm_storage_container.scripts.name}/${azurerm_storage_blob.install_agent_script.name}?${local.install_agent_sas_token}"
  vsts_agent_url          = "https://${module.sa-01.storage_account_name}.blob.core.windows.net/${azurerm_storage_container.scripts.name}/${azurerm_storage_blob.vsts_agent_tarball.name}?${local.install_agent_sas_token}"
}

resource "azurerm_public_ip" "pip" {
  name                = "pip-self-host"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Basic"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic_01" {
  name                = "nic-self-host"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }

  tags = var.tags
}

module "vm-01" {
  source                = "../Skeletons/virtual_machine"
  name                  = "vm-self-host"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.nic_01.id]
  admin_username        = var.vm_admin_username
  size                  = "Standard_B4ms"
  admin_password        = var.vm_admin_password
}

resource "azurerm_virtual_machine_extension" "install_selfhosted_agent" {
  name                 = "install-agent-extension"
  virtual_machine_id   = module.vm-01.vm_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    fileUris = [
      local.install_script_url,
      local.vsts_agent_url
    ],
    commandToExecute = "sed -i 's/azureuser/${var.vm_admin_username}/g' install-agent.sh && bash install-agent.sh"
  })
}
