resource "azurerm_disk_encryption_set" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  location            = module.resource_group.azurerm_resource_group.example.location
  key_vault_key_id    = module.key_vault_key.azurerm_key_vault_key.example.example.id

  identity {
    type = var.identity_type
  }
}
