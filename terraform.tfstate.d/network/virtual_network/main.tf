
resource "azurerm_virtual_network" "example" {
  name                = var.name
  address_space       = var.address_space
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
}
