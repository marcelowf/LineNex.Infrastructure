variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
}

variable "location" {
  description = "The location/region where the App Service will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the App Service."
  type        = string
}

variable "app_settings" {
  description = "A map of key-value pairs for App Service application settings."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to assign to the App Service."
  type        = map(string)
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan to associate with the App Service."
  type        = string
}