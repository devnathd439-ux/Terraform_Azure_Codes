# Public IP for Bastion
resource "azurerm_public_ip" "bastion" {
  name                = "bastion-pip"
  location            = "centralindia"
  resource_group_name = "project_time_machine"
  allocation_method   = "Static"
  sku                 = "Standard"
}
# Bastion Host
resource "azurerm_bastion_host" "bastion" {
  name                = "timemachine_bastion"
  location            = "centralindia"
  resource_group_name = "project_time_machine"

  ip_configuration {
    name                 = "bastion-ipcfg"
    subnet_id            = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/AzureBastionSubnet"
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
}