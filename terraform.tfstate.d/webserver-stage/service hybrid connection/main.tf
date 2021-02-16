resource "azurerm_app_service_hybrid_connection" "example" {
  app_service_name    = module.app_service.azurerm_app_service.example.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  relay_id            = azurerm_relay_hybrid_connection.example.id
  hostname            = var.hostname
  port                = var.port
  send_key_name       = var.send_key_name
}
