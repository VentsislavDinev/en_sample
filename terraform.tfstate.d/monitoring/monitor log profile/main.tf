resource "azurerm_resource_group" "example" {
  name     = "logprofiletest-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "example" {
  name                     = "afscsdfytw"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_eventhub_namespace" "example" {
  name                = "logprofileeventhub"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  capacity            = 2
}

resource "azurerm_monitor_log_profile" "example" {
  name = var.name

  categories = var.categories
  locations = var.locations

  # RootManageSharedAccessKey is created by default with listen, send, manage permissions
  servicebus_rule_id = "${azurerm_eventhub_namespace.example.id}/authorizationrules/RootManageSharedAccessKey"
  storage_account_id = azurerm_storage_account.example.id

  retention_policy {
    enabled = var.retention_enabled
    days    = var.retention_days
  }
}