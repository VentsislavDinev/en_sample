resource "azurerm_monitor_scheduled_query_rules_alert" "example2" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  authorized_resource_ids = [module.insight.azurerm_application_insights.example.id]
  action {
    action_group           = []
    email_subject          = var.action_email
    custom_webhook_payload = var.action_custom_webhook
  }
  data_source_id = module.insight.azurerm_application_insights.example.id
  description    = var.description
  enabled        = var.enabled
  
  severity    = var.severity
  frequency   = var.frequency
  time_window = var.time_window
  trigger {
    operator  = var.operator
    threshold = var.threshold
  }
}