resource "azurerm_orchestrated_virtual_machine_scale_set" "example" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  platform_fault_domain_count = var.platform_fault

  zones = var.zones
}