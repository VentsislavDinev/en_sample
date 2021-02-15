data "azurerm_availability_set" "example" {
  name                = "tf-appsecuritygroup"
  resource_group_name = "my-resource-group"
}

output "availability_set_id" {
  value = data.azurerm_availability_set.example.id
}