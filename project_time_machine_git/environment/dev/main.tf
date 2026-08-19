module "time_machine_rg" {
  source          = "../../child_modules/resource_group"
  time_machine_rg = var.time_machine_rg
}
module "time_machine_virtual_networks" {
  depends_on                    = [module.time_machine_rg]
  source                        = "../../child_modules/virtual_network"
  time_machine_virtual_networks = var.time_machine_virtual_networks
}
module "time_machine_subnet" {
  depends_on          = [module.time_machine_virtual_networks]
  source              = "../../child_modules/subnet"
  time_machine_subnet = var.time_machine_subnet
}
module "timemachine_subnet_pip" {
  depends_on             = [module.time_machine_subnet]
  source                 = "../../child_modules/nat_gatway/timemachine_subnet_pip"
  timemachine_subnet_pip = var.timemachine_subnet_pip
}
module "timemachine_nat_gatway" {
  depends_on             = [module.time_machine_subnet]
  source                 = "../../child_modules/nat_gatway/timemachine_nat_gatway"
  timemachine_nat_gatway = var.timemachine_nat_gatway
}
module "nat_subnet_association" {
  depends_on             = [module.timemachine_nat_gatway]
  source                 = "../../child_modules/nat_gatway/nat_subnet_association"
  nat_subnet_association = var.nat_subnet_association
}
module "nat_ip_association" {
  depends_on         = [module.timemachine_subnet_pip, module.timemachine_nat_gatway]
  source             = "../../child_modules/nat_gatway/nat_ip_association"
  nat_ip_association = var.nat_ip_association
}
module "nic_cards" {
  depends_on = [module.time_machine_subnet]
  source     = "../../child_modules/virtual_machine/nic_cards"
  nic_cards  = var.nic_cards
}
module "os_resources" {
  depends_on   = [module.nic_cards]
  source       = "../../child_modules/virtual_machine/os_resources"
  os_resources = var.os_resources
}
module "bastion_host" {
  depends_on = [module.time_machine_subnet, module.timemachine_subnet_pip]
  source     = "../../child_modules/bastion_host"
}
module "vnet_peering" {
  depends_on = [module.time_machine_virtual_networks]
  source     = "../../child_modules/vnet_peering"
}
module "nsgs" {
  depends_on = [module.time_machine_rg, module.time_machine_virtual_networks, module.time_machine_subnet]
  source     = "../../child_modules/network_security"
  nsgs       = var.nsgs
}