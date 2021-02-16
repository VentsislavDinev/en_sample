resource "azurerm_lb_rule" "example" {
  resource_group_name            = module.resource_group.azurerm_resource_group.example.name
  loadbalancer_id                = module.load_balance.azurerm_lb.example.id
  name                           = var.name
  protocol                       = var.protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_configuration
}
