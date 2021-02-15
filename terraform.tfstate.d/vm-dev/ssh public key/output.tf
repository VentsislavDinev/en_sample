data "azurerm_ssh_public_key" "example" {
  name                = "existing"
  resource_group_name = "existing"
}

output "id" {
  value = data.azurerm_ssh_public_key.example.id
}