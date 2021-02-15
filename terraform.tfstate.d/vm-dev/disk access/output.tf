data "azurerm_disk_access" "example" {
  name                = "existing"
  resource_group_name = "existing"
}

output "id" {
  value = data.azurerm_disk_access.example.id
}