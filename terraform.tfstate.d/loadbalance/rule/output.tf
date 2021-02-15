data "azurerm_lb" "example" {
  name                = "example-lb"
  resource_group_name = "example-resources"
}

data "azurerm_lb_rule" "example" {
  name                = "first"
  resource_group_name = "example-resources"
  loadbalancer_id     = data.azurerm_lb.example.id
}

output "lb_rule_id" {
  value = data.azurerm_lb_rule.example.id
}