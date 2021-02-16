
resource "azurerm_storage_container" "example" {
  name                  = var.name
  storage_account_name  = module.resource_group.azurerm_resource_group.example.name
  container_access_type = var.access_type
}