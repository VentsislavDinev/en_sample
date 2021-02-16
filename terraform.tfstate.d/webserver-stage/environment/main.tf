resource "azurerm_app_service_environment" "example" {
  name                         = var.name
  subnet_id                    = module.subnet.azurerm_subnet.example.id
  pricing_tier                 = var.pricing_tier
  front_end_scale_factor       = var.front_end_scale
  internal_load_balancing_mode = var.internal_load_balance
  allowed_user_ip_cidrs        = var.allowed_user

  cluster_setting {
    name  = var.cluster_name
    value = var.cluster_value
  }
}
