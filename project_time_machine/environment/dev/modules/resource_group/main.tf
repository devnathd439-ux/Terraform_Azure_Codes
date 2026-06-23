resource "azurerm_resource_group" "time_machine" {
  for_each = var.time_machine
  name     = each.key
  location = each.value
}
