time_machine_subnet = {
  bastionhost_subnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "project_time_machine"
    virtual_network_name = "power_unit"
    address_prefixes     = ["10.143.0.0/18"]
  }
  main_switch_subnet = {
    name                 = "main_switch"
    resource_group_name  = "project_time_machine"
    virtual_network_name = "power_unit"
    address_prefixes     = ["10.143.64.0/18"]
  }
  flux_capacitor_subnet = {
    name                 = "flux_capacitor"
    resource_group_name  = "project_time_machine"
    virtual_network_name = "power_unit"
    address_prefixes     = ["10.143.128.0/18"]
  }
  time_circuit_subnet = {
    name                 = "time_circuit"
    resource_group_name  = "project_time_machine"
    virtual_network_name = "control_unit"
    address_prefixes     = ["10.148.0.0/16"]
  }
}