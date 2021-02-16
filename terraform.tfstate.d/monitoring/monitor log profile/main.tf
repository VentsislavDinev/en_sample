resource "azurerm_monitor_log_profile" "example" {
  name = var.name

  categories = var.categories
  locations = var.locations

  # RootManageSharedAccessKey is created by default with listen, send, manage permissions
  servicebus_rule_id = "${azurerm_eventhub_namespace.example.id}/authorizationrules/RootManageSharedAccessKey"
  storage_account_id = module.account.azurerm_storage_account.example.id

  retention_policy {
    enabled = var.retention_enabled
    days    = var.retention_days
  }
}