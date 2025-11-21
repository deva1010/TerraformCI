terraform {
  required_version = ">=1.13.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.54.0"
    }
  }

  cloud {
    organization = "devesh-shringi"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "1-bd689655-playground-sandbox"
  location = "South Central US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "stgreclaim9541"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}