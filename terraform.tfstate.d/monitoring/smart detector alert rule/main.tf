resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_application_insights" "example" {
  name                = "example-appinsights"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = "web"
}

resource "azurerm_monitor_action_group" "example" {
  name                = "example-action-group"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "exampleactiongroup"
}

resource "azurerm_monitor_smart_detector_alert_rule" "example" {
  name                = var.name
  resource_group_name = azurerm_resource_group.example.name
  severity            = var.severity
  scope_resource_ids  = [azurerm_application_insights.example.id]
  frequency           = var.frequency
  detector_type       = var.detector_type

  action_group {
    ids = [azurerm_monitor_action_group.test.id]
  }
}