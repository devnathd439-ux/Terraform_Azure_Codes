resource "azurerm_nat_gateway_public_ip_association" "nat_ip_association" {
  for_each = {
    mainswitch = {
      nat_gateway_id       = var.nat_ip_association.mainswitch.mainswitch_nat_id
      public_ip_address_id = var.nat_ip_association.mainswitch.mainswitch_pip_id
    }
    # fluxcapacitor = {
    #   nat_gateway_id       = var.nat_ip_association.fluxcapacitor.fluxcapacitor_nat_id
    #   public_ip_address_id = var.nat_ip_association.fluxcapacitor.fluxcapacitor_pip_id
    # }
    timecircuit = {
      nat_gateway_id       = var.nat_ip_association.timecircuit.timecircuit_nat_id
      public_ip_address_id = var.nat_ip_association.timecircuit.timecircuit_pip_id
    }
    # bastionhost = {
    #   nat_gateway_id       = var.nat_ip_association.bastionhost.bastionhost_nat_id
    #   public_ip_address_id = var.nat_ip_association.bastionhost.bastionhost_pip_id
    # }
  }
  nat_gateway_id       = each.value.nat_gateway_id
  public_ip_address_id = each.value.public_ip_address_id
}