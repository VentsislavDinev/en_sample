data "azurerm_dedicated_host" "example" {
  name                      = "example-host"
  dedicated_host_group_name = "example-host-group"
  resource_group_name       = "example-resources"
}

output "dedicated_host_id" {
  value = data.azurerm_dedicated_host.example.id
}