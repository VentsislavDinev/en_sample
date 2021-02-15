data "azurerm_mariadb_server" "db_server" {
  name                = "mariadb-server"
  resource_group_name = azurerm_mariadb_server.example.resource_group_name
}

output "mariadb_server_id" {
  value = data.azurerm_mariadb_server.example.id
}