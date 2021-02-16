resource "azurerm_container_registry" "acr" {
  name                     = var.name
  resource_group_name      = module.resource_group.azurerm_resource_group.example.name
  location                 = module.resource_group.azurerm_resource_group.example.location
  sku                      = var.sku
  admin_enabled            = var.admin_enabled
  georeplication_locations = va.georeplication_locations
}
