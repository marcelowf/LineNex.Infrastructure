module "vnet_01" {
  source              = "../Skeletons/virtual_network_without_delegation"
  vnet_name           = "vnet-self-host"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["172.24.128.0/21"]

  subnets = {
    sub-01 = {
      name              = "sub-vm"
      address_prefix    = ["172.24.128.0/24"]
      service_endpoints = ["Microsoft.Sql"]
    }
  }

  tags = var.tags
}

data "azurerm_subnet" "vm_subnet" {
  name                 = "sub-vm"
  virtual_network_name = module.vnet_01.vnet_name
  resource_group_name  = azurerm_resource_group.rg.name
}
