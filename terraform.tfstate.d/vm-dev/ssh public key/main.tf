resource "azurerm_ssh_public_key" "example" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  public_key          = file(var.public_key)
}