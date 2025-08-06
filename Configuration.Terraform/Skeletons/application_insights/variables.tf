variable "name" {
  type        = string
  description = "Name of the Application Insights"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
