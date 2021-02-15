data "azurerm_app_service_certificate" "example" {
  name                = "example-app-service-certificate"
  resource_group_name = "example-rg"
}

output "app_service_certificate_id" {
  value = data.azurerm_app_service_certificate.example.id
}