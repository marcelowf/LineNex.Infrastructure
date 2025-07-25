locals {
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  subnets             = var.subnets
  tags                = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = local.address_space
  dns_servers         = local.dns_servers
  tags                = local.tags

  dynamic "subnet" {
    for_each = local.subnets
    content {
      name              = subnet.value.name
      address_prefixes  = subnet.value.address_prefix
      service_endpoints = subnet.value.service_endpoints != [] ? subnet.value.service_endpoints : []
    }
  }
}
