resource "azurerm_subnet" "time_machine_subnet" {
  for_each = {
    bastionhost_subnet    = var.time_machine_subnet.bastionhost_subnet
    main_switch_subnet    = var.time_machine_subnet.main_switch_subnet
    flux_capacitor_subnet = var.time_machine_subnet.flux_capacitor_subnet
    time_circuit_subnet   = var.time_machine_subnet.time_circuit_subnet
  }
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}