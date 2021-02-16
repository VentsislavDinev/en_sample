resource "azurerm_windows_virtual_machine" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  location            = module.resource_group.azurerm_resource_group.example.location
  size                = var.size
  admin_username      = var.username
  admin_password      = var.password
  network_interface_ids = [
    module.network_interface.azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = var.os_caching
    storage_account_type = var.os_storage
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}