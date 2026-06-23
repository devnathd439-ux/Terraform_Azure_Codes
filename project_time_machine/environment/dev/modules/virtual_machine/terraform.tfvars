nic_cards = {
  nic_1 = {
    nic_card_name       = "main_switch_windows-vm-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "main_switch_config"
    subnet_id           = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/main_switch"
  }
  nic_2 = {
    nic_card_name       = "flux_capacitor_linux-vm-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "flux_capacitor_config"
    subnet_id           = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/power_unit/subnets/flux_capacitor"
  }
  nic_3 = {
    nic_card_name       = "time_circuit_linux-vm-nic"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    config_name         = "time_circuit_config"
    subnet_id           = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/virtualNetworks/control_unit/subnets/time_circuit"
  }
}
os_resources = {
  main_switch_vm = {
    vm_name             = "mainswitch"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/main_switch_windows-vm-nic"
    vm_size             = "Standard_B2ats_v2"
    # zone                = "2"

    storage_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-datacenter-g2"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "main_switch_vm_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Time_Machine"
      admin_username = "timetraveler"
      admin_password = "Timemachine@123"
    }
  }
  flux_capacitor_linux_vm = {
    vm_name             = "fluxcapacitor"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/flux_capacitor_linux-vm-nic"
    vm_size             = "Standard_B2ats_v2"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "flux_capacitor_vm_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Flux_Capacitor"
      admin_username = "timetraveler"
      admin_password = "Timemachine@123"
    }
  }
  time_circuit_linux_vm = {
    vm_name             = "timecircuit"
    location            = "centralindia"
    resource_group_name = "project_time_machine"
    nic_id              = "/subscriptions/a112f499-171d-4e54-bb69-e2536fa4c7af/resourceGroups/project_time_machine/providers/Microsoft.Network/networkInterfaces/time_circuit_linux-vm-nic"
    vm_size             = "Standard_B2ats_v2"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "time_circuit_vm_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Time_Circuit"
      admin_username = "timetraveler"
      admin_password = "Timemachine@123"
    }
  }
}