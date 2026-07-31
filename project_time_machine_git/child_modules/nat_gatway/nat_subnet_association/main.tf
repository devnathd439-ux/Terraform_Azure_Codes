resource "azurerm_subnet_nat_gateway_association" "nat_subnet_association" {
  for_each = {
    mainswitch = {
      subnet_id      = var.nat_subnet_association.mainswitch.mainswitch_subnet_id
      nat_gateway_id = var.nat_subnet_association.mainswitch.mainswitch_nat_id
    }
    # fluxcapacitor = {
    #   subnet_id      = var.nat_subnet_association.fluxcapacitor.fluxcapacitor_subnet_id
    #   nat_gateway_id = var.nat_subnet_association.fluxcapacitor.fluxcapacitor_nat_id
    # }
    timecircuit = {
      subnet_id      = var.nat_subnet_association.timecircuit.timecircuit_subnet_id
      nat_gateway_id = var.nat_subnet_association.timecircuit.timecircuit_nat_id
    }
    # bastionhost = {
    #   subnet_id      = var.nat_subnet_association.bastionhost.bastionhost_subnet_id
    #   nat_gateway_id = var.nat_subnet_association.bastionhost.bastionhost_nat_id
    # }
  }
  subnet_id      = each.value.subnet_id
  nat_gateway_id = each.value.nat_gateway_id
}