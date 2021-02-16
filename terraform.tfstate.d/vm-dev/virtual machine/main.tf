resource "azurerm_virtual_machine" "main" {
  name                  = var.name
  location              = module.resource_group.azurerm_resource_group.example.location
  resource_group_name   = module.resource_group.azurerm_resource_group.example.name
  network_interface_ids = [module.network_interface.azurerm_network_interface.example.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  storage_os_disk {
    name              = var.image_os_name
    caching           = var.image_os_caching
    create_option     = var.image_os_create
    managed_disk_type = var.image_os_managed
  }
  os_profile {
    computer_name  = var.image_profile_computer
    admin_username = var.image_profile_username
    admin_password = var.image_profile_password
  }
  os_profile_linux_config {
    disable_password_authentication = var.image_linux_disabled_pass_auth
  }
  provisioner "file" {
    source      = var.source_file
    destination = var.destination

    connection {
      type     = "winrm"
      user     = var.admin_username
      password = var.admin_password
      host     = var.host
    }
  }
}