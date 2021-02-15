data "azurerm_proximity_placement_group" "example" {
  name                = "tf-appsecuritygroup"
  resource_group_name = "my-resource-group"
}

output "proximity_placement_group_id" {
  value = data.azurerm_proximity_placement_group.example.id
}