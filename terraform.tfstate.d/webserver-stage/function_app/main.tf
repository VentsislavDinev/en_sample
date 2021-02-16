resource "azurerm_function_app" "example" {
  name                       = var.name
  location                   = module.resource_group.azurerm_resource_group.example.location
  resource_group_name        = module.resource_group.azurerm_resource_group.example.name
  app_service_plan_id        = module.service_plan.azurerm_app_service_plan.example.example.id
  storage_account_name       = module.account.azurerm_storage_account.example.name
  storage_account_access_key = module.account.azurerm_storage_account.example.primary_access_key
}