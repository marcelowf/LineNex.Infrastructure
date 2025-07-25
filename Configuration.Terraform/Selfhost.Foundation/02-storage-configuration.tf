module "sa-01" {
  source                   = "../Skeletons/storage_account"
  sa_name                  = "saselfhost"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg.name
  tags                     = var.tags
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "scripts" {
  name                  = "self-host-scripts"
  storage_account_id    = module.sa-01.storage_account_id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "install_agent_script" {
  name                   = "install-agent.sh"
  storage_account_name   = module.sa-01.storage_account_name
  storage_container_name = azurerm_storage_container.scripts.name
  type                   = "Block"

  source_content = templatefile("${path.module}/Installers/install-agent-template.sh", {
    organization      = var.azure_devops_org
    pat_token         = var.azure_devops_pat
    vm_admin_username = var.vm_admin_username
    agent_version     = var.agent_version
    agent_filename    = var.agent_filename
  })
}

resource "azurerm_storage_blob" "vsts_agent_tarball" {
  name                   = var.agent_filename
  storage_account_name   = module.sa-01.storage_account_name
  storage_container_name = azurerm_storage_container.scripts.name
  type                   = "Block"
  source                 = "${path.module}/Installers/${var.agent_filename}"
}

resource "time_offset" "sas_start" {
  offset_minutes = -5
  base_rfc3339   = timestamp()
}

resource "time_offset" "sas_expiry" {
  offset_hours = 1
  base_rfc3339 = timestamp()
}

data "azurerm_storage_account_sas" "self-host-scripts" {
  connection_string = module.sa-01.storage_account_primary_connection_string

  https_only = true
  start      = time_offset.sas_start.rfc3339
  expiry     = time_offset.sas_expiry.rfc3339

  resource_types {
    object    = true
    container = false
    service   = false
  }
  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }
  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
    tag     = false
    filter  = false
  }
}
