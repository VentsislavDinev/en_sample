data "azurerm_disk_encryption_set" "example" {
  name                = "existing"
  resource_group_name = "existing"
}

output "id" {
  value = data.azurerm_disk_encryption_set.example.id
}