resource "azurerm_image" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  os_disk {
    os_type  = var.os_disk_type
    os_state = var.os_disk_state
    blob_uri = var.os_disk_blob_url
    size_gb  = var.os_disk_size_gb
  }
}