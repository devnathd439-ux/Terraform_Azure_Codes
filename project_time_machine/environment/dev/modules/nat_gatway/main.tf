# Public IP for main switch NAT Gateway
# resource "azurerm_public_ip" "timemachine_subnet_pip" {
#   for_each = {
#     mainswitch_pip    = var.timemachine_subnet_pip.mainswitch
#     fluxcapacitor_pip = var.timemachine_subnet_pip.fluxcapacitor
#     timecircuit_pip   = var.timemachine_subnet_pip.timecircuit
#   }
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   allocation_method   = each.value.allocation_method
#   sku                 = each.value.sku
# }
resource "azurerm_nat_gateway" "timemachine_nat_gatway" {
  for_each = {
    mainswitch_nat_gateway    = var.timemachine_nat_gatway.mainswitch
    fluxcapacitor_nat_gateway = var.timemachine_nat_gatway.fluxcapacitor
    timecircuit_nat_gateway   = var.timemachine_nat_gatway.timecircuit
  }
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
}
# resource "azurerm_nat_gateway_public_ip_association" "nat_ip_association" {
#   for_each = {
#     mainswitch = {
#       nat_gateway_id       = var.nat_ip_association.mainswitch.mainswitch_nat_id
#       public_ip_address_id = var.nat_ip_association.mainswitch.mainswitch_pip_id
#     }
#     fluxcapacitor = {
#       nat_gateway_id       = var.nat_ip_association.fluxcapacitor.fluxcapacitor_nat_id
#       public_ip_address_id = var.nat_ip_association.fluxcapacitor.fluxcapacitor_pip_id
#     }
#     timecircuit = {
#       nat_gateway_id       = var.nat_ip_association.timecircuit.timecircuit_nat_id
#       public_ip_address_id = var.nat_ip_association.timecircuit.timecircuit_pip_id
#     }
#   }
#   nat_gateway_id       = each.value.nat_gateway_id
#   public_ip_address_id = each.value.public_ip_address_id
#   depends_on = [
#     azurerm_nat_gateway.timemachine_nat_gatway,
#     azurerm_public_ip.timemachine_subnet_pip
#   ]
# }
resource "azurerm_subnet_nat_gateway_association" "nat_subnet_association" {
  for_each = {
    mainswitch = {
      subnet_id      = var.nat_subnet_association.mainswitch.mainswitch_subnet_id
      nat_gateway_id = var.nat_subnet_association.mainswitch.mainswitch_nat_id
    }
    fluxcapacitor = {
      subnet_id      = var.nat_subnet_association.fluxcapacitor.fluxcapacitor_subnet_id
      nat_gateway_id = var.nat_subnet_association.fluxcapacitor.fluxcapacitor_nat_id
    }
    timecircuit = {
      subnet_id      = var.nat_subnet_association.timecircuit.timecircuit_subnet_id
      nat_gateway_id = var.nat_subnet_association.timecircuit.timecircuit_nat_id
    }
  }
  subnet_id      = each.value.subnet_id
  nat_gateway_id = each.value.nat_gateway_id
  depends_on = [
    azurerm_nat_gateway.timemachine_nat_gatway
  ]
}