resource "azurerm_resource_group" "example" {
  name     = "exampleResourceGroup1"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "example" {
  name                = "exampleAppServicePlan1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "exampleAppService1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

resource "azurerm_relay_namespace" "example" {
  name                = "exampleRN1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku_name = "Standard"
}

resource "azurerm_relay_hybrid_connection" "example" {
  name                 = "exampleRHC1"
  resource_group_name  = azurerm_resource_group.example.name
  relay_namespace_name = azurerm_relay_namespace.example.name
  user_metadata        = "examplemetadata"
}

resource "azurerm_app_service_hybrid_connection" "example" {
  app_service_name    = azurerm_app_service.example.name
  resource_group_name = azurerm_resource_group.example.name
  relay_id            = azurerm_relay_hybrid_connection.example.id
  hostname            = var.hostname
  port                = var.port
  send_key_name       = var.send_key_name
}
