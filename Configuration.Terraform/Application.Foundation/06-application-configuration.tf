module "asp_01" {
  source                = "../Skeletons/app_service_plan"
  app_service_plan_name = "asp-linenex-${var.env_suffix}"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  sku_name              = "B1"
  os_type               = "Linux"
  tags                  = var.tags
}

module "as_01" {
  source              = "../Skeletons/app_service"
  app_service_name    = "app-linenex-backend-${var.env_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id     = module.asp_01.id
  tags                = var.tags
  identity_type       = "SystemAssigned"

  app_settings = merge(
    var.common_app_settings,
    {
      "APPINSIGHTS_INSTRUMENTATIONKEY"        = module.app_insights_backend.instrumentation_key
      "APPLICATIONINSIGHTS_CONNECTION_STRING" = module.app_insights_backend.connection_string
    }
  )
}

module "as_02" {
  source              = "../Skeletons/app_service"
  app_service_name    = "app-linenex-frontend-${var.env_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id     = module.asp_01.id
  tags                = var.tags
  identity_type       = "SystemAssigned"

  app_settings = merge(
    var.common_app_settings,
    {
      "APPINSIGHTS_INSTRUMENTATIONKEY"        = module.app_insights_frontend.instrumentation_key
      "APPLICATIONINSIGHTS_CONNECTION_STRING" = module.app_insights_frontend.connection_string
    }
  )
}

resource "azurerm_app_service_virtual_network_swift_connection" "api_vnet_integration_01" {
  app_service_id = module.as_01.id
  subnet_id      = module.vnet-01.subnet_ids["sub-app-${var.env_suffix}"]
}

resource "azurerm_app_service_virtual_network_swift_connection" "api_vnet_integration_02" {
  app_service_id = module.as_02.id
  subnet_id      = module.vnet-01.subnet_ids["sub-app-${var.env_suffix}"]
}

module "app_insights_backend" {
  source              = "../Skeletons/application_insights"
  name                = "appi-linenex-backend-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

module "app_insights_frontend" {
  source              = "../Skeletons/application_insights"
  name                = "appi-linenex-frontend-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}
