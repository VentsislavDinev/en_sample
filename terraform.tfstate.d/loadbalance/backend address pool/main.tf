resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = module.load_balance.azurerm_lb.example.id
  name            = var.name
}