time_machine_rg = {
  project_time_machine = "centralindia"
}
time_machine_storage_account = {
  timemachinestorage = {
    name                = "timemachinestorage"
    resource_group_name = "project_time_machine"
    location            = "centralindia"
  }
}
time_machine_virtual_networks = {
  vnet_1 = {
    name                = "power_unit"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    address_space       = ["10.143.0.0/16"]
  }
  vnet_2 = {
    name                = "control_unit"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    address_space       = ["10.148.0.0/16"]
  }
}
time_machine_subnet = {
  bastionhost_subnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "project_time_machine"
    virtual_network_name = "power_unit"
    address_prefixes     = ["10.143.0.0/18"]
  }
  main_switch_subnet = {
    name                 = "main_switch"
    resource_group_name  = "project_time_machine"
    virtual_network_name = "power_unit"
    address_prefixes     = ["10.143.64.0/18"]
  }
  flux_capacitor_subnet = {
    name                 = "flux_capacitor"
    resource_group_name  = "project_time_machine"
    virtual_network_name = "power_unit"
    address_prefixes     = ["10.143.128.0/18"]
  }
  time_circuit_subnet = {
    name                 = "time_circuit"
    resource_group_name  = "project_time_machine"
    virtual_network_name = "control_unit"
    address_prefixes     = ["10.148.0.0/16"]
  }
}
timemachine_subnet_pip = {
  mainswitch = {
    name                = "mainswitch-pip"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    allocation_method   = "Static"
    sku                 = "StandardV2"
  }
  fluxcapacitor = {
    name                = "fluxcapacitor-pip"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    allocation_method   = "Static"
    sku                 = "StandardV2"
  }
  timecircuit = {
    name                = "timecircuit-pip"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    allocation_method   = "Static"
    sku                 = "StandardV2"
  }
  # Public IP for Bastion
  bastionhost = {
    name                = "bastionhost-pip"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
timemachine_nat_gatway = {
  mainswitch = {
    name                = "mainswitch-nat-gateway"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    sku_name            = "StandardV2"
  }
  fluxcapacitor = {
    name                = "fluxcapacitor-nat-gateway"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    sku_name            = "StandardV2"
  }
  timecircuit = {
    name                = "timecircuit-nat-gateway"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    sku_name            = "StandardV2"
  }
  # bastionhost = {
  #   name                = "bastionhost-nat-gateway"
  #   location            = "centralindia"
  #   resource_group_name = "project_time_machine"
  #   sku_name            = "StandardV2"
  # }
}
nat_subnet_association = {
  mainswitch = {
    mainswitch_subnet_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/main_switch"
    mainswitch_nat_id    = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/mainswitch-nat-gateway"
  }
  fluxcapacitor = {
    fluxcapacitor_subnet_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/flux_capacitor"
    fluxcapacitor_nat_id    = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/fluxcapacitor-nat-gateway"
  }
  timecircuit = {
    timecircuit_subnet_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/control_unit/subnets/time_circuit"
    timecircuit_nat_id    = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/timecircuit-nat-gateway"
  }
  # bastionhost = {
  #   bastionhost_subnet_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/AzureBastionSubnet"
  #   bastionhost_nat_id    = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/bastionhost-nat-gateway"
  # }
}
nat_ip_association = {
  mainswitch = {
    mainswitch_nat_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/mainswitch-nat-gateway"
    mainswitch_pip_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/mainswitch-pip"
  }
  fluxcapacitor = {
    fluxcapacitor_nat_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/fluxcapacitor-nat-gateway"
    fluxcapacitor_pip_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/fluxcapacitor-pip"
  }
  timecircuit = {
    timecircuit_nat_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/timecircuit-nat-gateway"
    timecircuit_pip_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/timecircuit-pip"
  }
  # bastionhost = {
  #   bastionhost_nat_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/natGateways/bastionhost-nat-gateway"
  #   bastionhost_pip_id = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/publicIPAddresses/bastionhost-pip"
  # }
}
nic_cards = {
  nic_1 = {
    nic_card_name       = "main_switch_windows-vm-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "main_switch_config"
    subnet_id           = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/main_switch"
  }
  nic_2 = {
    nic_card_name       = "main_switch_linux-vm-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "main_switch_config"
    subnet_id           = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/main_switch"
  }
  nic_3 = {
    nic_card_name       = "flux_capacitor_linux-vm1-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "flux_capacitor_config"
    subnet_id           = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/flux_capacitor"
  }
  nic_4 = {
    nic_card_name       = "flux_capacitor_linux-vm2-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "flux_capacitor_config"
    subnet_id           = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/flux_capacitor"
  }
  nic_5 = {
    nic_card_name       = "time_circuit_linux-vm1-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "time_circuit_config"
    subnet_id           = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/control_unit/subnets/time_circuit"
  }
  nic_6 = {
    nic_card_name       = "time_circuit_linux-vm2-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "time_circuit_config"
    subnet_id           = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/control_unit/subnets/time_circuit"
  }
}
os_resources = {
  main_switch_windows-vm = {
    vm_name             = "mainswitch-windows"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/main_switch_windows-vm-nic"
    vm_size             = "Standard_B2ats_v2"
    storage_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-datacenter-g2"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "main_switch_windows-vm_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Time-Machine"
      admin_username = "devopsadmin"
      admin_password = "devopsadmin@123"
    }
  }
  main_switch_linux-vm = {
    vm_name             = "mainswitch-linux"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/main_switch_linux-vm-nic"
    vm_size             = "Standard_B2ats_v2"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "main_switch_linux-vm_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Main-Switch-linux"
      admin_username = "devopsadmin"
      admin_password = "devopsadmin@123"
    }
  }
  flux_capacitor_linux-vm1 = {
    vm_name             = "fluxcapacitor-linux1"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/flux_capacitor_linux-vm1-nic"
    vm_size             = "Standard_B2ats_v2"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "flux_capacitor_linux-vm1_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Flux-Capacitor1"
      admin_username = "devopsadmin"
      admin_password = "devopsadmin@123"
    }
  }
  flux_capacitor_linux-vm2 = {
    vm_name             = "fluxcapacitor-linux2"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/flux_capacitor_linux-vm2-nic"
    vm_size             = "Standard_B2ats_v2"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "flux_capacitor_linux-vm2_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Flux-Capacitor2"
      admin_username = "devopsadmin"
      admin_password = "devopsadmin@123"
    }
  }
  time_circuit_linux-vm1 = {
    vm_name             = "timecircuit-linux1"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/time_circuit_linux-vm1-nic"
    vm_size             = "Standard_B2ats_v2"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "time_circuit_linux-vm1_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Time-Circuit1"
      admin_username = "devopsadmin"
      admin_password = "devopsadmin@123"
    }
  }
  time_circuit_linux-vm2 = {
    vm_name             = "timecircuit-linux2"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/cdff66fc-4d7e-40e4-8240-b6efe889082c/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/time_circuit_linux-vm2-nic"
    vm_size             = "Standard_B2ats_v2"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "time_circuit_linux-vm2_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Time_Circuit2"
      admin_username = "devopsadmin"
      admin_password = "devopsadmin@123"
    }
  }
}
nsgs = {
  name                = "time_machine_nsg"
  location            = "centralindia"
  resource_group_name = "project_time_machine"
}