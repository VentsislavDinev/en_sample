resource "azurerm_dedicated_host_group" "example" {
  name                        = var.name
  resource_group_name         = module.resource_group.azurerm_resource_group.example.name
  location                    = module.resource_group.azurerm_resource_group.example.location
  platform_fault_domain_count = var.fault_domain_count
}