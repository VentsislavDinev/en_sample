data "azurerm_app_service_certificate_order" "example" {
  name                = "example-cert-order"
  resource_group_name = "example-resources"
}

output "certificate_order_id" {
  value = data.azurerm_app_service_certificate_order.example.id
}