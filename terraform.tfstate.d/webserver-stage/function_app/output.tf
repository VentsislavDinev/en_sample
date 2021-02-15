data "azurerm_function_app" "example" {
  name                = "test-azure-functions"
  resource_group_name = azurerm_resource_group.example.name
}


output "id" {
  value = data.azurerm_function_app.example.id
}