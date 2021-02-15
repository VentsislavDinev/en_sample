resource "azurerm_mariadb_firewall_rule" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}