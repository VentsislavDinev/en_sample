
resource "azurerm_subnet" "internal" {
  name                 = var.name
  resource_group_name  = module.resource_group.azurerm_resource_group.example.name
  virtual_network_name = module.virtual_network.azurerm_virtual_network.example.name
  address_prefixes     = var.prefixes
  service_endpoints    = var.endpoints
}