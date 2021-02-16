resource "azurerm_shared_image" "example" {
  name                = var.name
  gallery_name        = module.shared_image_gallery.azurerm_shared_image_gallery.example.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  location            = module.resource_group.azurerm_resource_group.example.location
  os_type             = var.os_type

  identifier {
    publisher = var.identifier_publisher
    offer     = var.identifier_offer
    sku       = var.identifier_sku
  }
}