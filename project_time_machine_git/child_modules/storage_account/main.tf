resource "azurerm_storage_account" "project_time_machine_storage" {
  name                     = var.time_machine_storage_account.name
  resource_group_name      = var.time_machine_storage_account.resource_group_name
  location                 = var.time_machine_storage_account.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "tfstate_container" {
  depends_on           = [azurerm_storage_account.project_time_machine_storage] 
  name                  = var.tfstate_container.name
  storage_account_id    = azurerm_storage_account.project_time_machine_storage.id
  container_access_type = "private" 
}
