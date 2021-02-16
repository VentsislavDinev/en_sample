resource "azurerm_app_service_slot_virtual_network_swift_connection" "example" {
  slot_name      = module.service_plan.azurerm_app_service_plan.example.name
  app_service_id = module.app_service.azurerm_app_service.example.id
  subnet_id      = module.subnet.azurerm_subnet.example.id
}
