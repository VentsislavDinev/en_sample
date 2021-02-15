resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_monitor_action_group" "example" {
  name                = "example-action-group"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "exampleactiongroup"
}

resource "azurerm_monitor_action_rule_action_group" "example" {
  name                = var.name
  resource_group_name = azurerm_resource_group.example.name
  action_group_id     = azurerm_monitor_action_group.example.id

  scope {
    type         = var.scope_type
    resource_ids = [azurerm_resource_group.example.id]
  }

}