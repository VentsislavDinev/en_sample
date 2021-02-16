resource "azurerm_monitor_action_rule_suppression" "example" {
  name                = var.azure_name
  resource_group_name = module.resource_group.azurerm_resource_group.example.name

  scope {
    type         = var.type
    resource_ids = [module.resource_group.azurerm_resource_group.example.id]
  }

  suppression {
    recurrence_type = var.recurrence_type

    schedule {
      start_date_utc    = var.start_date_utc
      end_date_utc      = var.end_date_utc
      recurrence_weekly = var.recurrence_weekly
    }
  }
}
