resource "azurerm_snapshot" "example" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  create_option       = var.create_option
  source_uri          = module.managed_disk.azurerm_managed_disk.example.id
}