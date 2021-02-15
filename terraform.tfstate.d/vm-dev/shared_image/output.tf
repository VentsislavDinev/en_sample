data "azurerm_image" "search" {
  name                = "search-api"
  resource_group_name = "packerimages"
}

output "image_id" {
  value = data.azurerm_image.search.id
}