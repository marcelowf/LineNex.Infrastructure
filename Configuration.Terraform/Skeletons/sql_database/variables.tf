variable "sql_database_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "location" {
  description = "Azure region where the virtual network will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the virtual network"
  type        = map(string)
  default     = {}
}

variable "server_id" {
  description = "The ID of the SQL Server to create the database in."
  type        = string
}

variable "collation" {
  description = "The collation of the SQL Database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "max_size_gb" {
  description = "The maximum size of the SQL Database in GB."
  type        = number
  default     = 2
}

variable "sku_name" {
  description = "The SKU name of the SQL Database."
  type        = string
  default     = "S0"
}

variable "enclave_type" {
  description = "The enclave type of the SQL Database."
  type        = string
  default     = "Default"
}

variable "server_fqdn" {
  description = "Fully qualified domain name of the SQL Server"
  type        = string
}

variable "admin_user" {
  description = "SQL Server admin user"
  type        = string
}

variable "admin_password" {
  description = "SQL Server admin password"
  type        = string
  sensitive   = true
}
