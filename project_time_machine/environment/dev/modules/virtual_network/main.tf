resource "azurerm_virtual_network" "time_machine_virtual_networks" {
  for_each = {
    vnet_1 = var.time_machine_virtual_networks.vnet_1,
    vnet_2 = var.time_machine_virtual_networks.vnet_2
  }
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}