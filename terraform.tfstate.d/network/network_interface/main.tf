
resource "azurerm_network_interface" "main" {
  name                = var.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = var.ip_private
  }
}