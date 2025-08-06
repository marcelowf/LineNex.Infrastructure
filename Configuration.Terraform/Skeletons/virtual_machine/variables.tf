variable "name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "location" {
  description = "The location/region where the virtual machine will be created."
  type        = string
}

variable "size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "network_interface_ids" {
  description = "A list of network interface IDs to associate with the virtual machine."
  type        = list(string)
}

variable "admin_username" {
  description = "Virtual machine Admin."
  type        = string
}

variable "admin_password" {
  description = "Virtual machine Password."
  type        = string
}