resource "azurerm_windows_virtual_machine_scale_set" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  location            = module.resource_group.azurerm_resource_group.example.location
  sku                 = var.sku
  instances           = var.instances
  admin_password      = var.pass
  admin_username      = var.username

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_disk {
    storage_account_type = var.disk_storage
    caching              = var.disk_caching
  }

  network_interface {
    name    = var.network_interface_name
    primary = var.network_interface_primary

    ip_configuration {
      name      = var.network_ip_name
      primary   = var.network_ip_primary
      subnet_id = module.subnet.azurerm_subnet.example.id
    }
  }
}
