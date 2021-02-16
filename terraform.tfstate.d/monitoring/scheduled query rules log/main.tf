# Example: LogToMetric Action for the named Computer
resource "azurerm_scheduled_query_rules_log" "example" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  criteria {
    metric_name = var.metric_name
    dimensions {
      name     = var.dimension_name
      operator = var.dimension_operator
      values   = var.dimension_values
    }
  }
  data_source_id = azurerm_log_analytics_workspace.example.id
  description    = var.dimension_description
  enabled        = var.dimension_enabled
}