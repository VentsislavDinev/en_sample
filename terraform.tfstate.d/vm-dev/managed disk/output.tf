data "azurerm_managed_disk" "existing" {
  name                = "example-datadisk"
  resource_group_name = "example-resources"
}

output "id" {
  value = data.azurerm_managed_disk.existing.id
}