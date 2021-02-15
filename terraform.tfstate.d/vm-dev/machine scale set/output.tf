data "azurerm_virtual_machine_scale_set" "example" {
  name                = "existing"
  resource_group_name = "existing"
}

output "id" {
  value = data.azurerm_virtual_machine_scale_set.example.id
}