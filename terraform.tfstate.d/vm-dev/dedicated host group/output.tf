data "azurerm_dedicated_host_group" "example" {
  name                = "example-dedicated-host-group"
  resource_group_name = "example-rg"
}

output "id" {
  value = data.azurerm_dedicated_host_group.example.id
}