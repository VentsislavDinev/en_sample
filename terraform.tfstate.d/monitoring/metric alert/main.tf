resource "azurerm_monitor_metric_alert" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  scopes              = [module.account.azurerm_storage_account.example.id]
  description         = var.description

  criteria {
    metric_namespace = var.metric_namespace
    metric_name      = var.metric_name
    aggregation      = var.aggregation
    operator         = var.operator
    threshold        = var.threshold

    dimension {
      name     = var.dimension_name
      operator = var.dimension_operator
      values   = var.dimension_values
    }
  }

  action {
    action_group_id = module.action_group.azurerm_monitor_action_group.test.id
  }
}