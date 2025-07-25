resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
  tags                        = var.tags

  public_network_access_enabled = var.public_network_access_enabled

  dynamic "network_acls" {
    for_each = length(var.virtual_network_subnet_ids) > 0 ? [1] : []
    content {
      default_action             = "Deny"
      bypass                     = "AzureServices"
      virtual_network_subnet_ids = var.virtual_network_subnet_ids
    }
  }

  dynamic "access_policy" {
    for_each = var.access_policies
    content {
      tenant_id           = data.azurerm_client_config.current.tenant_id
      object_id           = access_policy.value.object_id
      key_permissions     = access_policy.value.key_permissions
      secret_permissions  = access_policy.value.secret_permissions
      storage_permissions = access_policy.value.storage_permissions
    }
  }
}

data "azurerm_client_config" "current" {}
