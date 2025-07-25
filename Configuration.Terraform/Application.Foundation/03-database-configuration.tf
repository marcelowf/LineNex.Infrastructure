module "sql-server-01" {
  source              = "../Skeletons/sql_server"
  sql_server_name     = "sql-linenex-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  admin_password      = var.sql_server_admin_password
  admin_login         = var.sql_server_admin_login
}

module "sql-database-01" {
  source              = "../Skeletons/sql_database"
  sql_database_name   = "sqldb-linenex-${var.env_suffix}"
  tags                = var.tags
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  server_id           = module.sql-server-01.id
  server_fqdn         = module.sql-server-01.sql_server_fully_qualified_domain_name
  admin_user          = module.sql-server-01.sql_server_administrator_login
  admin_password      = var.sql_server_admin_password
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb         = 2
  sku_name            = "S0"
  enclave_type        = "Default"
}

resource "azurerm_mssql_virtual_network_rule" "sql_vnet_integration-01" {
  name      = "sql-vnet-rule"
  server_id = module.sql-server-01.id
  subnet_id = module.vnet-01.subnet_ids["sub-sql-${var.env_suffix}"]
}
