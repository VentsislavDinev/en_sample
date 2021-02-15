
resource "azurerm_virtual_network" "example" {
  name                = var.name
  address_space       = var.address_space
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
