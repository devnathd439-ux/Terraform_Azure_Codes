# Public IP for Bastion Host & NAT Gateway if required in future
resource "azurerm_public_ip" "timemachine_subnet_pip" {
  for_each = {
    mainswitch_pip = var.timemachine_subnet_pip.mainswitch
    # fluxcapacitor_pip = var.timemachine_subnet_pip.fluxcapacitor
    timecircuit_pip   = var.timemachine_subnet_pip.timecircuit
    bastionhost_pip    = var.timemachine_subnet_pip.bastionhost
  }
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}