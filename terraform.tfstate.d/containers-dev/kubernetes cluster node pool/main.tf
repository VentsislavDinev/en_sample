resource "azurerm_kubernetes_cluster_node_pool" "example" {
  name                  = var.name
  kubernetes_cluster_id = module.kubernetes_cluster.azurerm_kubernetes_cluster.example.id
  vm_size               = var.vm_size
  node_count            = var.node_count

  tags = {
    Environment = var.tags_env
  }
}