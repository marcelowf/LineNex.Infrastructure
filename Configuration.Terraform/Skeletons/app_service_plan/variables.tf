variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the App Service Plan."
  type        = string
}

variable "os_type" {
  description = "The operating system type for the App Service Plan (e.g., Windows or Linux)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service Plan will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the App Service Plan will be deployed."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the App Service Plan."
  type        = map(string)
  default     = {}
}