resource "azurerm_resource_group" "example" {
  name     = "monitoring-resources"
  location = "West US"
}

resource "azurerm_application_insights" "example" {
  name                = "appinsights"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = "web"
}

resource "azurerm_application_insights" "example2" {
  name                = "appinsights2"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = "web"
}


# Example: Alerting Action Cross-Resource
resource "azurerm_monitor_scheduled_query_rules_alert" "example2" {
  name                = var.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  authorized_resource_ids = [azurerm_application_insights.example2.id]
  action {
    action_group           = []
    email_subject          = var.action_email
    custom_webhook_payload = var.action_custom_webhook
  }
  data_source_id = azurerm_application_insights.example.id
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