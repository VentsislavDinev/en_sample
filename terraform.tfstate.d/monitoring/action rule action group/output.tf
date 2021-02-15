data "azurerm_monitor_action_group" "example" {
  resource_group_name = "terraform-example-rg"
  name                = "tfex-actiongroup"
}

output "action_group_id" {
  value = data.azurerm_monitor_action_group.example.id
}
