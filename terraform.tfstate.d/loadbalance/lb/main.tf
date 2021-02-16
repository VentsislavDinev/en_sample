resource "azurerm_lb" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = module.public_ip.azurerm_public_ip.example.id
  }
}