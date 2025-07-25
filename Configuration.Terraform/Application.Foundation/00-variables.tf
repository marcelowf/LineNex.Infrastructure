variable "sql_server_admin_password" {
  type      = string
  sensitive = true
}

variable "sql_server_admin_login" {
  type      = string
  sensitive = true
}

variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "location" {
  type      = string
  sensitive = true
}

variable "tags" {
  type = map(string)
}

variable "env_suffix" {
  type = string
}

variable "common_app_settings" {
  type = map(string)
}

variable "key_vault_public_access" {
  type = bool
}