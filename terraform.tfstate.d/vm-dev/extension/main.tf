resource "azurerm_virtual_machine_extension" "example" {
  name                 = var.name
  virtual_machine_id   = module.virtual_machine.azurerm_virtual_machine.example.id
  publisher            = var.publisher
  type                 = var.type
  type_handler_version = var.handler_version

}