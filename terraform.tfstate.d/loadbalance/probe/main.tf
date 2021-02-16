resource "azurerm_lb_probe" "example" {
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  loadbalancer_id     = module.load_balance.azurerm_lb.example.id
  name                = var.name
  port                = var.port
}
