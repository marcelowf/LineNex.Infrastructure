location                  = "East US 2"
key_vault_public_access   = true

tags = {
  owner               = "marcelo"
  project             = "linenex"
  business_unit       = "engineering"
  criticality         = "high"
  data_classification = "internal"
  managed_by          = "terraform"
  technical_contact   = "marcelo.projects.dev@gmail.com"
  # backup             = "enabled"
}

common_app_settings = {
  WEBSITE_RUN_FROM_PACKAGE     = "1"
  WEBSITE_NODE_DEFAULT_VERSION = "14"
}
