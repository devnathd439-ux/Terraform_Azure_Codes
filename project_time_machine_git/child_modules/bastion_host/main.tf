resource "azurerm_bastion_host" "bastionhost" {
  name                = "timemachine_bastionhost"
  location            = "centralindia"
  resource_group_name = "project_time_machine"

  ip_configuration {
    name                 = "bastion-ipcfg"
    subnet_id            = "/subscriptions/b2dd57896-7866-4df4-8c9e-6830338bdf29/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/AzureBastionSubnet"
    public_ip_address_id = "/subscriptions/2dd57896-7866-4df4-8c9e-6830338bdf29/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/bastionhost-pip"
  }
}