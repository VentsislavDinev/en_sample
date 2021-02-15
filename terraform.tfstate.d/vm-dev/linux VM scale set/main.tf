provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = var.name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = var.sku
  instances           = var.instances
  admin_username      = var.admin_username

  admin_ssh_key {
    username   = var.ssh_username
    public_key = file(var.ssh_public_key)
  }

  source_image_reference {
    publisher = var.source_publisher
    offer     = var.source_offer
    sku       = var.source_sku
    version   = var.source_vers
  }

  os_disk {
    storage_account_type = var.os_storage
    caching              = var.os_caching
  }

  network_interface {
    name    = var.network_name
    primary = var.network_primary

    ip_configuration {
      name      = var.network_ip_name
      primary   = var.network_ip_primary
      subnet_id = azurerm_subnet.internal.id
    }
  }
}