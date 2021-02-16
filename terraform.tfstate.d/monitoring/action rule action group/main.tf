resource "azurerm_monitor_action_rule_action_group" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  action_group_id     = module.action_group.azurerm_monitor_action_group.test.id

  scope {
    type         = var.scope_type
    resource_ids = [module.resource_group.azurerm_resource_group.example.id]
  }

}