resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West US 2"
}

resource "azurerm_virtual_network" "example" {
  name                = "acctvn"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "acctsub"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "example" {
  name                = "test"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  domain_name_label   = azurerm_resource_group.example.name

  tags = {
    environment = "staging"
  }
}

resource "azurerm_lb" "example" {
  name                = "test"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  resource_group_name = azurerm_resource_group.example.name
  loadbalancer_id     = azurerm_lb.example.id
  name                = "BackEndAddressPool"
}

resource "azurerm_lb_nat_pool" "lbnatpool" {
  resource_group_name            = azurerm_resource_group.example.name
  name                           = "ssh"
  loadbalancer_id                = azurerm_lb.example.id
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50119
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_lb_probe" "example" {
  resource_group_name = azurerm_resource_group.example.name
  loadbalancer_id     = azurerm_lb.example.id
  name                = "http-probe"
  protocol            = "Http"
  request_path        = "/health"
  port                = 8080
}

resource "azurerm_virtual_machine_scale_set" "example" {
  name                = var.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  # automatic rolling upgrade
  automatic_os_upgrade = var.automatic_os_upgrade
  upgrade_policy_mode  = var.upgrade_policy

  rolling_upgrade_policy {
    max_batch_instance_percent              = var.max_batch
    max_unhealthy_instance_percent          = var.max_unhealthy
    max_unhealthy_upgraded_instance_percent = var.max_unhealthy_upgraded
    pause_time_between_batches              = var.max_pause_time
  }

  # required when using rolling upgrade policy
  health_probe_id = azurerm_lb_probe.example.id

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  storage_profile_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.vers
  }

  storage_profile_os_disk {
    name              = var.storage_name
    caching           = var.storage_cacheng
    create_option     = var.storage_create_option
    managed_disk_type = var.storage_managed_disk
  }

  storage_profile_data_disk {
    lun           = var.storage_profile_lun
    caching       = var.storage_profile_caching
    create_option = var.storage_profile_create_options
    disk_size_gb  = var.storage_profile_disk
  }

  os_profile {
    computer_name_prefix = var.os_compute
    admin_username       = var.os_admin
  }

  os_profile_linux_config {
    disable_password_authentication = var.os_profile_disable

    ssh_keys {
      path     = var.os_profile_ssh_path
      key_data = file(var.os_profile_key_data)
    }
  }

  network_profile {
    name    = var.network_name
    primary = var.network_primary

    ip_configuration {
      name                                   = var.network_ip_name
      primary                                = var.network_ip_primary
      subnet_id                              = azurerm_subnet.example.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bpepool.id]
      load_balancer_inbound_nat_rules_ids    = [azurerm_lb_nat_pool.lbnatpool.id]
    }
  }
}