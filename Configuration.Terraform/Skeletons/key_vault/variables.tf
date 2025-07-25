variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for the Key Vault."
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to the Key Vault."
  type        = map(string)
}

variable "access_policies" {
  description = "List of access policies to assign to the Key Vault."
  type = list(object({
    object_id           = string
    key_permissions     = list(string)
    secret_permissions  = list(string)
    storage_permissions = list(string)
  }))
}

variable "public_network_access_enabled" {
  description = "Permite (true) ou bloqueia (false) acesso público ao Key Vault."
  type        = bool
  default     = true
}

variable "virtual_network_subnet_ids" {
  description = "Lista de subnets que podem acessar o Key Vault quando o firewall está ativo."
  type        = list(string)
  default     = []
}
