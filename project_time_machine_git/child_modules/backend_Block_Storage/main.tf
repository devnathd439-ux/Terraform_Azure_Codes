terraform {
  backend "azurerm" {
    resource_group_name  = "project_time_machine"
    storage_account_name = "timemachinestorage"
    container_name       = "tfstate"
    key                 = "envs/dev/terraform.tfstate"
  }
}