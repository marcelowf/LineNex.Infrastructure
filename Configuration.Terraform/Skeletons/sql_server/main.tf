locals {
  name                = var.sql_server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_mssql_server" "mssql_server" {
  name                         = local.name
  resource_group_name          = local.resource_group_name
  location                     = local.location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
  tags                         = local.tags
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.mssql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "devops_ip" {
  name             = "DevOps"
  server_id        = azurerm_mssql_server.mssql_server.id
  start_ip_address = "20.219.82.82"
  end_ip_address   = "20.219.82.82"
}
