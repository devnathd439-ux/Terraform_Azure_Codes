resource "azurerm_virtual_network_peering" "power_unit" {
  name                      = "peer1to2"
  resource_group_name       = "project_time_machine"
  virtual_network_name      = "control_unit"
  remote_virtual_network_id = "/subscriptions/2dd57896-7866-4df4-8c9e-6830338bdf29/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit"
}
resource "azurerm_virtual_network_peering" "control_unit" {
  name                      = "peer2to1"
  resource_group_name       = "project_time_machine"
  virtual_network_name      = "power_unit"
  remote_virtual_network_id = "/subscriptions/2dd57896-7866-4df4-8c9e-6830338bdf29/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/control_unit"
}