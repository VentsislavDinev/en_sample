resource "azurerm_lb_outbound_rule" "example" {
  resource_group_name     = module.resource_group.azurerm_resource_group.example.name
  loadbalancer_id         = module.load_balance.azurerm_lb.example.id
  name                    = var.name
  protocol                = var.protocol
  backend_address_pool_id = module.backend_address_poolazurerm_lb_backend_address_pool.example.id

  frontend_ip_configuration {
    name = var.name
  }
}