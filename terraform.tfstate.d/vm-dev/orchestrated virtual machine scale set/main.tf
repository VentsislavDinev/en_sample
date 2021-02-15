resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_orchestrated_virtual_machine_scale_set" "example" {
  name                = var.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  platform_fault_domain_count = var.platform_fault

  zones = var.zones
}