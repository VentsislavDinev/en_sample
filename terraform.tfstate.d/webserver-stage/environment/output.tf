data "azurerm_app_service_environment" "example" {
  name                = "existing-ase"
  resource_group_name = "existing-rg"
}

output "id" {
  value = data.azurerm_app_service_environment.example.id
}