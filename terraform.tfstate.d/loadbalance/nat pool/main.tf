resource "azurerm_lb_nat_pool" "example" {
  resource_group_name            = module.resource_group.azurerm_resource_group.example.name
  loadbalancer_id                = module.load_balance.azurerm_lb.example.id
  name                           = var.name
  protocol                       = var.prtocol
  frontend_port_start            = var.frontend_port_start
  frontend_port_end              = var.frontend_port_end
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
}