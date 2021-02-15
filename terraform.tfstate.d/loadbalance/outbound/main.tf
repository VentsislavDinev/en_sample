resource "azurerm_resource_group" "example" {
  name     = "LoadBalancerRG"
  location = "West US"
}

resource "azurerm_public_ip" "example" {
  name                = "PublicIPForLB"
  location            = "West US"
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "example" {
  name                = "TestLoadBalancer"
  location            = "West US"
  resource_group_name = azurerm_resource_group.example.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_lb_backend_address_pool" "example" {
  resource_group_name = azurerm_resource_group.example.name
  loadbalancer_id     = azurerm_lb.example.id
  name                = "be-%d"
}

resource "azurerm_lb_outbound_rule" "example" {
  resource_group_name     = azurerm_resource_group.example.name
  loadbalancer_id         = azurerm_lb.example.id
  name                    = var.name
  protocol                = var.protocol
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id

  frontend_ip_configuration {
    name = var.name
  }
}