data "azurerm_key_vault" "example" {
  name                = azurerm_key_vault.example.name
  resource_group_name = azurerm_key_vault.example.resource_group_name
}

data "azurerm_monitor_diagnostic_categories" "example" {
  resource_id = data.azurerm_key_vault.example.id
}
