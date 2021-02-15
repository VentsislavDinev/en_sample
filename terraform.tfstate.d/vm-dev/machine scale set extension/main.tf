resource "azurerm_linux_virtual_machine_scale_set" "example" {
  #...
}

resource "azurerm_virtual_machine_scale_set_extension" "example" {
  name                         = var.name
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.example.id
  publisher                    = var.publisher
  type                         = var.type
  type_handler_version         = var.type_hander
}