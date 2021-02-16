resource "azurerm_app_service_active_slot" "example" {
  resource_group_name   = module.resource_group.azurerm_resource_group.example.name
  app_service_name      = module.app_service.azurerm_app_service.example.name
  app_service_slot_name = module.service_slot.azurerm_app_service_slot.example.name
}