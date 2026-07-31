resource "azurerm_network_interface" "nic_cards" {
  for_each = {
    # nic_1 = var.nic_cards.nic_1
    nic_2 = var.nic_cards.nic_2
    # nic_3 = var.nic_cards.nic_3
    # nic_4 = var.nic_cards.nic_4
    nic_5 = var.nic_cards.nic_5
    # nic_6 = var.nic_cards.nic_6
  }
  name                = each.value.nic_card_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.config_name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}