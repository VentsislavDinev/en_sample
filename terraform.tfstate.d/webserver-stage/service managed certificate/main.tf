data "azurerm_dns_zone" "example" {
  name                = "mydomain.com"
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

resource "azurerm_dns_txt_record" "example" {
  name                = "asuid.mycustomhost.contoso.com"
  #zone_name           = data.azurerm_dns_zone.example.name
  #resource_group_name = data.azurerm_dns_zone.example.resource_group_name
  ttl                 = 300

  record {
    value = azurerm_app_service.example.custom_domain_verification_id
  }
}

resource "azurerm_app_service_custom_hostname_binding" "example" {
  hostname            = join(".", [azurerm_dns_cname_record.example.name, azurerm_dns_cname_record.example.zone_name])
  app_service_name    = azurerm_app_service.example.name
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_app_service_managed_certificate" "example" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.example.id
}