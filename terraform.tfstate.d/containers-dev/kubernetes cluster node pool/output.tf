data "azurerm_kubernetes_cluster_node_pool" "example" {
  name                    = "existing"
  kubernetes_cluster_name = "existing-cluster"
  resource_group_name     = "existing-resource-group"
}

output "id" {
  value = data.azurerm_kubernetes_cluster_node_pool.example.id
}