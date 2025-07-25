terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.25"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-linenex-${var.env_suffix}"
  location = var.location
}

data "azurerm_client_config" "current" {}

resource "random_integer" "number" {
  min = 1000
  max = 9999
  keepers = {
    rg = azurerm_resource_group.rg.name
  }
}
