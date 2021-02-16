resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  app_service_id = module.app_service.azurerm_app_service.example.id
  subnet_id      = module.subnet.azurerm_subnet.example.id
}