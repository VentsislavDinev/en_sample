
resource "azurerm_network_interface" "main" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = module.subnet.azurerm_subnet.example.id
    private_ip_address_allocation = var.ip_private
  }
}