module "nsg-01" {
  source              = "../Skeletons/network_security_groups"
  nsg_name            = "nsg-linenex-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  security_rules = [
    {
      name                       = "Allow-AzureDevOps"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "AzureDevOps"
      destination_address_prefix = "*"
    }
  ]
}

module "vnet-01" {
  source              = "../Skeletons/virtual_network"
  vnet_name           = "vnet-linenex-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["172.24.128.0/21"]

  subnets = {
    sub-01 = {
      name              = "sub-sql-${var.env_suffix}"
      address_prefix    = ["172.24.128.0/24"]
      service_endpoints = ["Microsoft.Sql"]
      delegation        = null
      associate_nsg     = true
    }
    sub-02 = {
      name           = "sub-app-${var.env_suffix}"
      address_prefix = ["172.24.130.0/24"]
      delegation = {
        name                       = "Microsoft.Web.serverFarmsDelegation"
        service_delegation_name    = "Microsoft.Web/serverFarms"
        service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
      }
      associate_nsg = false
    }
    sub-03 = {
      name              = "sub-key-${var.env_suffix}"
      address_prefix    = ["172.24.131.0/24"]
      service_endpoints = ["Microsoft.KeyVault"]
      delegation        = null
      associate_nsg     = true
    }
  }

  tags = var.tags
}
