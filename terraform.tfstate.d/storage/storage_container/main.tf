
resource "azurerm_storage_container" "example" {
  name                  = var.name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.access_type
}