resource "azurerm_dedicated_host" "example" {
  name                    = var.name
  location                = module.resource_group.azurerm_resource_group.example.location
  dedicated_host_group_id = module.dedicated_host_group.azurerm_dedicated_host_group.example.id
  sku_name                = var.sku
  platform_fault_domain   = var.platform_fault_domain
}