resource "azurerm_app_service_slot" "example" {
  name                = var.name
  app_service_name    = module.app_service.azurerm_app_service.example.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  app_service_plan_id = module.service_plan.azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = var.donet_framework
  }
  
  connection_string {
    name  = var.connection_name
    type  = var.connection_type
    value = var.connection_value
  }
}