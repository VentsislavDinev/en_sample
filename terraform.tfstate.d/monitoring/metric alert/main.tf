resource "azurerm_resource_group" "main" {
  name     = "example-resources"
  location = "West US"
}

resource "azurerm_storage_account" "to_monitor" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_monitor_action_group" "main" {
  name                = "example-actiongroup"
  resource_group_name = azurerm_resource_group.main.name
  short_name          = "exampleact"

  webhook_receiver {
    name        = "callmyapi"
    service_uri = "http://example.com/alert"
  }
}

resource "azurerm_monitor_metric_alert" "example" {
  name                = var.name
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_storage_account.to_monitor.id]
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
    action_group_id = azurerm_monitor_action_group.main.id
  }
}