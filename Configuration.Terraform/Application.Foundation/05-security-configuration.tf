module "kv_qa" {
  source              = "../Skeletons/key_vault"
  key_vault_name      = "kv-linenex-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  access_policies = [
    {
      object_id           = data.azurerm_client_config.current.object_id
      key_permissions     = ["Get", "List", "Delete", "Purge", "Recover"]
      secret_permissions  = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
      storage_permissions = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
    },
    {
      object_id           = module.as_01.principal_id
      key_permissions     = ["Get", "List"]
      secret_permissions  = ["Get", "List"]
      storage_permissions = ["Get", "List"]
    },
    {
      object_id           = module.as_02.principal_id
      key_permissions     = ["Get", "List"]
      secret_permissions  = ["Get", "List"]
      storage_permissions = ["Get", "List"]
    },
    # Setando meu user azure como key-user
    {
      object_id           = "de50d8e1-495e-4135-8cb4-a471808b0ed6"
      key_permissions     = ["Get", "List", "Delete", "Purge", "Recover"]
      secret_permissions  = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
      storage_permissions = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
    },
    # ObjectID do meu Service Connection (Para a pipeline poder criar os secrets)
    {
      object_id           = "d0a7ee2f-fbb2-4bf3-a94f-296192897d7d"
      key_permissions     = ["Get", "List", "Delete", "Purge", "Recover"]
      secret_permissions  = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
      storage_permissions = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
    },
  ]

  # public_network_access_enabled = var.key_vault_public_access
  # virtual_network_subnet_ids    = [module.vnet-01.subnet_ids["sub-key-${var.env_suffix}"]]
}

resource "azurerm_key_vault_secret" "backend_url" {
  name         = "BackendUrl"
  value = format("https://%s.azurewebsites.net", module.as_01.app_service_name)
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "frontend_url" {
  name         = "FrontendUrl"
  value = format("https://%s.azurewebsites.net", module.as_02.app_service_name)
  key_vault_id = module.kv_qa.id
}

resource "random_password" "jwt_secret" {
  length  = 64
  special = true
}

resource "azurerm_key_vault_secret" "jwt_secret_key" {
  name         = "JwtBearer--SecretKey"
  value        = random_password.jwt_secret.result
  key_vault_id = module.kv_qa.id

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [value]
  }
}

resource "azurerm_key_vault_secret" "jwt_token_issuer" {
  name         = "JwtBearer--TokenIssuer"
  value        = "<http://localhost:4000/>" # mudar isso depois
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "jwt_token_audience" {
  name         = "JwtBearer--TokenAudience"
  value        = "<http://localhost:4000/>" # mudar isso depois
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "email_form" {
  name         = "EmailSettings--FromEmail"
  value        = "marcelo.projects.dev@gmail.com"
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "email_password" {
  name         = "EmailSettings--Password"
  value        = "cueboapiuincxsdy"
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "email_smtp_host" {
  name         = "EmailSettings--SmtpHost"
  value        = "smtp.gmail.com"
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "email_smtp_port" {
  name         = "EmailSettings--SmtpPort"
  value        = "587"
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "db_connection_string" {
  name         = "ConnectionStrings--DefaultConnection"
  value        = module.sql-database-01.sql_connection_string
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "blob_connection_string" {
  name         = "BlobConnectionStrings--DefaultConnection"
  value        = module.sa-01.storage_account_primary_connection_string
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "blob_container_name" {
  name         = "BlobConnectionStrings--DefaultContainer"
  value        = "linenex-container"
  key_vault_id = module.kv_qa.id
}
