data "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = "example-resources"
}

data "azurerm_lb" "example" {
  name                = "example-lb"
  resource_group_name = "example-resources"
}

data "azurerm_lb_backend_address_pool" "example" {
  name            = "first"
  loadbalancer_id = data.azurerm_lb.example.id
}

resource "azurerm_lb_backend_address_pool_address" "example" {
  name                    = var.name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.example.id
  virtual_network_id      = data.azurerm_virtual_network.example.id
  ip_address              = var.ip_address
}