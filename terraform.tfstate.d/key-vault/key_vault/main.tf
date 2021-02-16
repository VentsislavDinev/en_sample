
resource "azurerm_key_vault" "example" {
  name                        = var.name
  location                    = module.resource_group.azurerm_resource_group.example.location
  resource_group_name         = module.resource_group.azurerm_resource_group.example.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.sku_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  soft_delete_enabled         = var.soft_delete_enabled
  purge_protection_enabled    = var.purge_enabled
}
