resource "azurerm_network_interface" "nic_cards" {
  for_each = {
    nic_1 = var.nic_cards.nic_1
    nic_2 = var.nic_cards.nic_2
    nic_3 = var.nic_cards.nic_3
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
# Create a virtual machines with the above network interface
resource "azurerm_virtual_machine" "os_resources" {
  for_each = {
    main_switch_vm          = var.os_resources.main_switch_vm
    flux_capacitor_linux_vm = var.os_resources.flux_capacitor_linux_vm
    time_circuit_linux_vm   = var.os_resources.time_circuit_linux_vm
  }
  depends_on = [
    azurerm_network_interface.nic_cards
  ]
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [each.value.nic_id]
  vm_size               = each.value.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }
  storage_os_disk {
    name              = each.value.storage_os_disk.name
    caching           = each.value.storage_os_disk.caching
    create_option     = each.value.storage_os_disk.create_option
    managed_disk_type = each.value.storage_os_disk.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.os_profile.computer_name
    admin_username = each.value.os_profile.admin_username
    admin_password = each.value.os_profile.admin_password
  }

  # os_profile_windows_config {
  #   enable_automatic_upgrades = true
  #   provision_vm_agent        = true
  # }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  #   tags = {
  #     environment = "staging"
  # }
}