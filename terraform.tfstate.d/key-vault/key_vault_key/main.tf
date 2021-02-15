
resource "azurerm_key_vault_key" "example" {
  name         = var.name
  key_vault_id = azurerm_key_vault.example.id
  key_type     = var.key_type
  key_size     = var.key_size

  depends_on = [
    azurerm_key_vault_access_policy.example-user
  ]

  key_opts = var.key_opts
}