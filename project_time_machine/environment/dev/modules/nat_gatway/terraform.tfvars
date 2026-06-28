# timemachine_subnet_pip = {
#   mainswitch = {
#     name                = "mainswitch-pip"
#     location            = "centralindia"
#     resource_group_name = "project_time_machine"
#     allocation_method   = "Static"
#     sku                 = "StandardV2"
#   }
#   fluxcapacitor = {
#     name                = "fluxcapacitor-pip"
#     location            = "centralindia"
#     resource_group_name = "project_time_machine"
#     allocation_method   = "Static"
#     sku                 = "StandardV2"
#   }
#   timecircuit = {
#     name                = "timecircuit-pip"
#     location            = "centralindia"
#     resource_group_name = "project_time_machine"
#     allocation_method   = "Static"
#     sku                 = "StandardV2"
#   }
# }
timemachine_nat_gatway = {
  mainswitch = {
    name                = "mainswitch-nat-gateway"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    sku_name            = "StandardV2"
  }
  fluxcapacitor = {
    name                = "fluxcapacitor-nat-gateway"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    sku_name            = "StandardV2"
  }
  timecircuit = {
    name                = "timecircuit-nat-gateway"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    sku_name            = "StandardV2"
  }
}
# nat_ip_association = {
#   mainswitch = {
#     mainswitch_nat_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/mainswitch-nat-gateway"
#     mainswitch_pip_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/mainswitch-pip"
#   }
#   fluxcapacitor = {
#     fluxcapacitor_nat_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/fluxcapacitor-nat-gateway"
#     fluxcapacitor_pip_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/fluxcapacitor-pip"
#   }
#   timecircuit = {
#     timecircuit_nat_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/timecircuit-nat-gateway"
#     timecircuit_pip_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/timecircuit-pip"
#   }
# }
nat_subnet_association = {
  mainswitch = {
    mainswitch_subnet_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/main_switch"
    mainswitch_nat_id    = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/mainswitch-nat-gateway"
  }
  fluxcapacitor = {
    fluxcapacitor_subnet_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/flux_capacitor"
    fluxcapacitor_nat_id    = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/fluxcapacitor-nat-gateway"
  }
  timecircuit = {
    timecircuit_subnet_id = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/control_unit/subnets/time_circuit"
    timecircuit_nat_id    = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/timecircuit-nat-gateway"
  }
}