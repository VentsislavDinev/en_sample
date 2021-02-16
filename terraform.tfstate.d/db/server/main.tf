resource "azurerm_mariadb_server" "example" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_login_pass

  sku_name   = var.sku
  storage_mb = var.storage_mb
  version    = var.version

  auto_grow_enabled             = var.auto_grouw
  backup_retention_days         = var.backup_days
  geo_redundant_backup_enabled  = var.geo_backup_enabled
  public_network_access_enabled = var.public_network_access_enabled
  ssl_enforcement_enabled       = var.ssl_enforcement_enabled
}