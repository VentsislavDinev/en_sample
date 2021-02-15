resource "azurerm_resource_group" "example" {
  name     = "example-resourcs"
  location = "West Europe"
}

resource "azurerm_dedicated_host_group" "example" {
  name                        = "example-host-group"
  resource_group_name         = azurerm_resource_group.example.name
  location                    = azurerm_resource_group.example.location
  platform_fault_domain_count = 2
}

resource "azurerm_dedicated_host" "example" {
  name                    = var.name
  location                = azurerm_resource_group.example.location
  dedicated_host_group_id = azurerm_dedicated_host_group.example.id
  sku_name                = var.sku
  platform_fault_domain   = var.platform_fault_domain
}