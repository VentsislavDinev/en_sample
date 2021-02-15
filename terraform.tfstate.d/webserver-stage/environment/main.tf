resource "azurerm_resource_group" "example" {
  name     = "exampleRG1"
  location = "westeurope"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "ase" {
  name                 = "asesubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "gateway" {
  name                 = "gatewaysubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_app_service_environment" "example" {
  name                         = var.name
  subnet_id                    = azurerm_subnet.ase.id
  pricing_tier                 = var.pricing_tier
  front_end_scale_factor       = var.front_end_scale
  internal_load_balancing_mode = var.internal_load_balance
  allowed_user_ip_cidrs        = var.allowed_user

  cluster_setting {
    name  = var.cluster_name
    value = var.cluster_value
  }
}
