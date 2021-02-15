resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_availability_set" "example" {
  name                = var.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}