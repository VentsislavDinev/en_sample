resource "azurerm_linux_virtual_machine" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  location            = module.resource_group.azurerm_resource_group.example.location
  size                = var.size
  admin_username      = var.admin_username
  network_interface_ids = [
    module.network_interface.azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = var.admin_ssh_username
    public_key = file(var.admin_ssh_public_key)
  }

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage
  }

  source_image_reference {
    publisher = var.os_source_publisher
    offer     = var.os_source_offer
    sku       = var.os_source_sku
    version   = var.os_source_version
  }
  
  provisioner "file" {
    source      = var.source_file
    destination = var.destination

    connection {
      type     = "ssh"
      user     = var.os_admin_username
      password = var.admin_password
      host     = var.host
    }
  }
}