resource "azurerm_resource_group" "example" {
  name     = "webapp"
  location = "australiaeast"
}

resource "azurerm_app_service_plan" "example" {
  name                = "appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Premium"
    size = "P1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "mywebapp"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

data "azurerm_dns_zone" "example" {
  name                = "example.com"
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_dns_cname_record" "example" {
  name                = "www"
  zone_name           = data.azurerm_dns_zone.example.name
  resource_group_name = data.azurerm_dns_zone.example.resource_group_name
  ttl                 = 300
  record              = azurerm_app_service.example.default_site_hostname
}

resource "azurerm_dns_txt_record" "example" {
  name                = "asuid.${azurerm_dns_cname_record.example.name}"
  zone_name           = data.azurerm_dns_zone.example.name
  resource_group_name = data.azurerm_dns_zone.example.resource_group_name
  ttl                 = 300
  record {
    value = azurerm_app_service.example.custom_domain_verification_id
  }
}

resource "azurerm_app_service_custom_hostname_binding" "example" {
  hostname            = trim(azurerm_dns_cname_record.example.fqdn, ".")
  app_service_name    = azurerm_app_service.example.name
  resource_group_name = azurerm_resource_group.example.name
  depends_on          = [azurerm_dns_txt_record.example]

  # Ignore ssl_state and thumbprint as they are managed using
  # azurerm_app_service_certificate_binding.example
  lifecycle {
    ignore_changes = [ssl_state, thumbprint]
  }
}

resource "azurerm_app_service_managed_certificate" "example" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.example.id
}

resource "azurerm_app_service_certificate_binding" "example" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.example.id
  certificate_id      = azurerm_app_service_managed_certificate.example.id
  ssl_state           = var.ssl_state
}