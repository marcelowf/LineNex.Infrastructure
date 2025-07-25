variable "sql_server_name" {
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

variable "admin_password" {
  description = "Password for SQL Server administrator"
  type        = string
  sensitive   = true
}

variable "admin_login" {
  description = "Login for SQL Server administrator"
  type        = string
  sensitive   = true
}
