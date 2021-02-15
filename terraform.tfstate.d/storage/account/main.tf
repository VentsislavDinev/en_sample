
resource "azurerm_storage_account" "to_monitor" {
  name                     = var.name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
}
