terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a112f499-171d-4e54-bb69-e2536fa4c7af"
}