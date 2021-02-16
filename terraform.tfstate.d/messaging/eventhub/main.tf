
resource "azurerm_eventhub_namespace" "example" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  sku                 = var.sku
  capacity            = var.capacity
}
