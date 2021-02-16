
resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = module.managed_disk.azurerm_managed_disk.example.id
  virtual_machine_id = module.virtual_machine.azurerm_virtual_machine.example.id
  lun                = var.lun
  caching            = var.caching
}