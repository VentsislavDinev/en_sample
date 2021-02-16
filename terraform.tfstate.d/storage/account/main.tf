
resource "azurerm_storage_account" "to_monitor" {
  name                     = var.name
  resource_group_name      = module.resource_group.azurerm_resource_group.example.name
  location                 = module.resource_group.azurerm_resource_group.example.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
}
