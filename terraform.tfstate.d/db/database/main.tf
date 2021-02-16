resource "azurerm_mariadb_database" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  server_name         = module.server.azurerm_mariadb_server.example.name
  charset             = var.charset
  collation           = var.collation
}
