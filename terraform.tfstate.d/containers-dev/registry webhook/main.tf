resource "azurerm_container_registry_webhook" "webhook" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  registry_name       = module.container_registry.azurerm_container_registry.example.name
  location            = module.resource_group.azurerm_resource_group.example.location

  service_uri = var.service_url
  status      = var.status
  scope       = var.scope
  actions     = var.action
}