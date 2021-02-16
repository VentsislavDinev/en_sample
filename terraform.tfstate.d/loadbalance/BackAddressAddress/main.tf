resource "azurerm_lb_backend_address_pool_address" "example" {
  name                    = var.name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.example.id
  virtual_network_id      = data.azurerm_virtual_network.example.id
  ip_address              = var.ip_address
}