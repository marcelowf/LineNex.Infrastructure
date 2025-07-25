terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.25"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9.1"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-self-host"
  location = var.location
  tags     = var.tags
}

data "azurerm_client_config" "current" {}
