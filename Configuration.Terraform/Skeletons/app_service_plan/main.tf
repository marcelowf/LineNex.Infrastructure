locals {
  app_service_plan_name = var.app_service_plan_name
  sku_name              = var.sku_name
  os_type               = var.os_type
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

resource "azurerm_service_plan" "asp" {
  name                = local.app_service_plan_name
  resource_group_name = local.resource_group_name
  location            = local.location
  os_type             = local.os_type
  sku_name            = local.sku_name
  tags                = local.tags
}