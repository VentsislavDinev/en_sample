resource "azurerm_resource_group" "example" {
  name     = "example-rg-compute"
  location = "West Europe"
}

resource "azurerm_dedicated_host_group" "example" {
  name                        = var.name
  resource_group_name         = azurerm_resource_group.example.name
  location                    = azurerm_resource_group.example.location
  platform_fault_domain_count = var.fault_domain_count
}