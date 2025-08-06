variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "location" {
  type      = string
  sensitive = true
}

variable "azure_devops_org" {
  type      = string
  sensitive = true
}

variable "azure_devops_pat" {
  type      = string
  sensitive = true
}

variable "agent_version" {
  type = string
}

variable "agent_filename" {
  type = string
}

variable "vm_admin_username" {
  type = string
}

variable "vm_admin_password" {
  type = string
  sensitive = true
}

variable "tags" {
  type = map(string)
}


