resource "azurerm_function_app_slot" "example" {
  name                       = var.name
  location                   = module.resource_group.azurerm_resource_group.example.location
  resource_group_name        = module.resource_group.azurerm_resource_group.example.name
  app_service_plan_id        = module.service_plan.azurerm_app_service_plan.example.id
  function_app_name          = module.function_app.azurerm_function_app.example.name
  storage_account_name       = module.account.azurerm_storage_account.example.name
  storage_account_access_key = module.account.azurerm_storage_account.example.primary_access_key
}