locals {
  location                 = var.location
  name                     = var.sa_name
  resource_group_name      = var.resource_group_name
  tags                     = var.tags
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_account" "sa" {
  name                     = local.name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = local.account_tier
  account_replication_type = local.account_replication_type
  tags = local.tags
}