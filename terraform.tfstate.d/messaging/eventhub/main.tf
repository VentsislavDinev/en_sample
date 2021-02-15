
resource "azurerm_eventhub_namespace" "example" {
  name                = var.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = var.sku
  capacity            = var.capacity
}
