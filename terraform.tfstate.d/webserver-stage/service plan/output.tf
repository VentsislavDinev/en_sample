data "azurerm_app_service_plan" "example" {
  name                = "search-app-service-plan"
  resource_group_name = "search-service"
}

output "app_service_plan_id" {
  value = data.azurerm_app_service_plan.example.id
}
