resource "azurerm_disk_access" "example" {
  name                = var.name
  resource_group_name = var.resource
  location            = var.location
}