data "azurerm_app_service" "example" {
  name                = "search-app-service"
  resource_group_name = "search-service"
}

output "app_service_id" {
  value = data.azurerm_app_service.example.id
}