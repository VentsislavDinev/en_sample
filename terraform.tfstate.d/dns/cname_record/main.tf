
resource "azurerm_dns_cname_record" "example" {
  name                = var.name
  zone_name           = data.azurerm_dns_zone.example.name
  resource_group_name = data.azurerm_dns_zone.example.resource_group_name
  ttl                 = var.ttl
  record              = var.record
}
