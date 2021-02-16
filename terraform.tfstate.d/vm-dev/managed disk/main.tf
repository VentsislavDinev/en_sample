resource "azurerm_managed_disk" "example" {
  name                 = var.name
  location             = var.location
  resource_group_name  = module.resource_group.azurerm_resource_group.example.name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
}