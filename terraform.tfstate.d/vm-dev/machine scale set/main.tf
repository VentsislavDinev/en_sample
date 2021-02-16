resource "azurerm_virtual_machine_scale_set" "example" {
  name                = var.name
  location            = module.resource_group.azurerm_resource_group.example.location
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

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
      subnet_id                              = module.subnet.azurerm_subnet.example.id
      load_balancer_backend_address_pool_ids = [module.nat_pool.azurerm_lb_nat_pool.example.id]
      load_balancer_inbound_nat_rules_ids    = [module.nat_pool.azurerm_lb_nat_pool.example.id]
    }
  }
}