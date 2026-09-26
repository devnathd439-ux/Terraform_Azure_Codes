terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  #   backend "azurerm" {
  #   resource_group_name  = "project_time_machine"
  #   storage_account_name = "timemachinestorage"
  #   container_name       = "tfstate"
  #   key                 = "envs/dev/terraform.tfstate"
  # }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "cdff66fc-4d7e-40e4-8240-b6efe889082c"
}