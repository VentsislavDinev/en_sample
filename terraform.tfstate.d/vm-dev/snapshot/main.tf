resource "azurerm_resource_group" "example" {
  name     = "snapshot-rg"
  location = "West Europe"
}

resource "azurerm_managed_disk" "example" {
  name                 = "managed-disk"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"
}

resource "azurerm_snapshot" "example" {
  name                = var.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  create_option       = var.create_option
  source_uri          = azurerm_managed_disk.example.id
}