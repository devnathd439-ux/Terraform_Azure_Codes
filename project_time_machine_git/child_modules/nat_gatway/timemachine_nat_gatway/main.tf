resource "azurerm_nat_gateway" "timemachine_nat_gatway" {
  for_each = {
    mainswitch_nat_gateway = var.timemachine_nat_gatway.mainswitch
    # fluxcapacitor_nat_gateway = var.timemachine_nat_gatway.fluxcapacitor
    timecircuit_nat_gateway   = var.timemachine_nat_gatway.timecircuit
    # nat_gateway_bastionhost = var.timemachine_nat_gatway.bastionhost
  }
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
}
