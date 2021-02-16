resource "azurerm_monitor_autoscale_setting" "example" {
  name                = var.name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name
  location            = module.resource_group.azurerm_resource_group.example.location
  target_resource_id  = module.machine_scale_set.azurerm_virtual_machine_scale_set.example.id

  profile {
    name = var.profile_name

    capacity {
      default = var.profile_capacity_default
      minimum = var.profile_capacity_minimum
      maximum = var.profile_capacity_maximum
    }

    rule {
      metric_trigger {
        metric_name        = var.profile_rule_metric_name
        metric_resource_id = module.machine_scale_set.azurerm_virtual_machine_scale_set.example.id
        time_grain         = var.profile_rule_time
        statistic          = var.profile_rule_statistic
        time_window        = var.profile_rule_time_window
        time_aggregation   = var.profile_rule_time_aggregation
        operator           = var.profile_rule_operator
        threshold          = var.profile_rule_threshold
        metric_namespace   = var.profile_rule_metric_namespace
        dimensions {
          name     = var.profile_rule_dimensions_name
          operator = var.profile_rule_dimensions_operator
          values   = var.profile_rule_dimensions_values
        }
      }

      scale_action {
        direction = var.profile_rule_direction
        type      = var.profile_rule_type
        value     = var.profile_rule_value
        cooldown  = var.profile_rule_cooldown
      }
    }

  }

  notification {
    email {
      send_to_subscription_administrator    = var.profile_rule_notification_administrator
      send_to_subscription_co_administrator = var.profile_rule_dimensions_co_administrator
      custom_emails                         = var.profile_profile_rule_dimensions_custom_email
    }
  }
}
