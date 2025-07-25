module "sa-01" {
  source                   = "../Skeletons/storage_account"
  sa_name                  = "salinenex${var.env_suffix}"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg.name
  tags                     = var.tags
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "scripts" {
  name                  = "container-linenex-${var.env_suffix}"
  storage_account_id    = module.sa-01.storage_account_id
  container_access_type = "blob"
}