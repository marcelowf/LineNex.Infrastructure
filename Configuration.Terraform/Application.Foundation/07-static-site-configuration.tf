resource "azurerm_static_web_app" "sapp_01" {
  name                = "app-linenex-blueprint-${var.env_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku_size            = "Standard"

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
