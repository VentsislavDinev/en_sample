resource "azurerm_app_service_certificate" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  location            = module.resource_group.azurerm_resource_group.example.location
  pfx_blob            = filebase64(var.pfx_blob)
  password            = var.password
}
