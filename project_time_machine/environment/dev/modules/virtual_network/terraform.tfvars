
time_machine_virtual_networks = {
  vnet_1 = {
    name                = "power_unit"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    address_space       = ["10.143.0.0/16"]
  },
  vnet_2 = {
    name                = "control_unit"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    address_space       = ["10.148.0.0/16"]
  }
}