data "azurerm_image" "existing" {
  name                = "search-api"
  resource_group_name = "packerimages"
}

data "azurerm_shared_image" "existing" {
  name                = "existing-image"
  gallery_name        = "existing_gallery"
  resource_group_name = "existing-resources"
}

resource "azurerm_shared_image_version" "example" {
  name                = var.name
  gallery_name        = data.azurerm_shared_image.existing.gallery_name
  image_name          = data.azurerm_shared_image.existing.name
  resource_group_name = data.azurerm_shared_image.existing.resource_group_name
  location            = data.azurerm_shared_image.existing.location
  managed_image_id    = data.azurerm_image.existing.id

  target_region {
    name                   = data.azurerm_shared_image.existing.location
    regional_replica_count = var.target_replica_count
    storage_account_type   = var.target_storage
  }
}