resource "azurerm_mariadb_virtual_network_rule" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  server_name         = module.server.azurerm_mariadb_server.example.name
  subnet_id           = module.subnet.azurerm_subnet.example.id
}
