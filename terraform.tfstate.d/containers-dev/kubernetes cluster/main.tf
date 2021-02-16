resource "azurerm_kubernetes_cluster" "example" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.default_node_pool_node
    vm_size    = var.default_node_pool_vm_sze
  }

  identity {
    type = var.type
  }

  tags = {
    Environment = var.tags_env
  }
}