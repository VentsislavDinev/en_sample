data "azurerm_container_registry" "example" {
  name                = "testacr"
  resource_group_name = "test"
}

output "login_server" {
  value = data.azurerm_container_registry.example.login_server
}