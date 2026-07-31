resource "azurerm_resource_group" "time_machine_rg" {
  for_each = var.time_machine_rg
  name     = each.key
  location = each.value
}
