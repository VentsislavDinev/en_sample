resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = var.name
  #target_resource_id = data.azurerm_key_vault.example.id
  storage_account_id = data.azurerm_storage_account.example.id

  log {
    category = var.category
    enabled  = var.log_enabled

    retention_policy {
      enabled = var.log_retention_enabled
    }
  }

  metric {
    category = var.metric_category

    retention_policy {
      enabled = var.metric_retention_enabled
    }
  }
}