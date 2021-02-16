resource "azurerm_monitor_smart_detector_alert_rule" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  severity            = var.severity
  scope_resource_ids  = [module.insight.azurerm_application_insights.example.id]
  frequency           = var.frequency
  detector_type       = var.detector_type

  action_group {
    ids = [module.action_group.azurerm_monitor_action_group.test.id]
  }
}