

resource "azurerm_dns_txt_record" "example" {
  name                = var.name
  zone_name           = var.dns_zone_name 
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl
  record {
    value = var.record
  }
}