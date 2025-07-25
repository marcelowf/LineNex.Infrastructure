variable "vnet_name" {
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

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "List of DNS servers"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "Map of subnet objects"
  type = map(object({
    name              = string
    address_prefix    = list(string)
    service_endpoints = optional(list(string), [])
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the virtual network"
  type        = map(string)
  default     = {}
}
