module "vnet-01" {
  source              = "../Skeletons/virtual_network"
  vnet_name           = "vn-linenex-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["172.24.128.0/21"]

  subnets = {
    sub-01 = {
      name              = "sub-sql-${var.env_suffix}"
      address_prefix    = ["172.24.128.0/24"]
      service_endpoints = ["Microsoft.Sql"]
      delegation        = null
    }
    sub-02 = {
      name           = "sub-app-${var.env_suffix}"
      address_prefix = ["172.24.130.0/24"]
      delegation = {
        name                       = "Microsoft.Web.serverFarmsDelegation"
        service_delegation_name    = "Microsoft.Web/serverFarms"
        service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
      }
    }
    sub-03 = {
      name              = "sub-key-${var.env_suffix}"
      address_prefix    = ["172.24.131.0/24"]
      service_endpoints = ["Microsoft.KeyVault"]
      delegation        = null
    }
  }
  tags = var.tags
}
