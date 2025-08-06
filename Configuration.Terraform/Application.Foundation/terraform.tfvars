location                  = "East US 2"
key_vault_public_access   = true

sql_server_admin_password = "!1storagepejvsqfdbszxc9@"
sql_server_admin_login = "cwbfinanceadmin"
subscription_id = "b34c3bc7-cdaf-402a-aff2-d58434c78df0"
env_suffix = "qa"

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
