
resource "azurerm_application_insights" "example" {
  name                = var.application_type
  location            = var.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  application_type    = var.name
}