resource "azurerm_bastion_host" "bastionhost" {
  name                = "timemachine_bastionhost"
  location            = "centralindia"
  resource_group_name = "project_time_machine"

  ip_configuration {
    name                 = "bastion-ipcfg"
    subnet_id            = "/subscriptions/b5040829-6fb6-4806-92be-0a7f26fd8012/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/AzureBastionSubnet"
    public_ip_address_id = "/subscriptions/b5040829-6fb6-4806-92be-0a7f26fd8012/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/bastionhost-pip"
  }
}