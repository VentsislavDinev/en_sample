resource "random_id" "server" {
  # ...
}

resource "azurerm_resource_group" "example" {
  # ...
}

resource "azurerm_app_service_plan" "example" {
  # ...
}

resource "azurerm_app_service" "example" {
  # ...
}

resource "azurerm_app_service_slot" "example" {
  # ...
}

resource "azurerm_app_service_active_slot" "example" {
  resource_group_name   = azurerm_resource_group.example.name
  app_service_name      = azurerm_app_service.example.name
  app_service_slot_name = azurerm_app_service_slot.example.name
}