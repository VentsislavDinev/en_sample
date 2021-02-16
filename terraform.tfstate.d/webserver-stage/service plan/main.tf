resource "azurerm_app_service_plan" "example" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}