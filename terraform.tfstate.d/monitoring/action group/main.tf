resource "azurerm_resource_group" "example" {
  name     = "monitoring-resources"
  location = "West US"
}

resource "azurerm_monitor_action_group" "example" {
  name                = var.name
  resource_group_name = azurerm_resource_group.example.name
  short_name          = var.short_name

  arm_role_receiver {
    name                    = var.arm_name
    role_id                 = var.arm_role_id
    use_common_alert_schema = var.arm_role_use_common
  }

  automation_runbook_receiver {
    name                    = var.automation_name
    automation_account_id   = var.automation_account_id
    runbook_name            = var.automation_runbook
    webhook_resource_id     = var.automation_webhook
    is_global_runbook       = var.automation_is_global
    service_uri             = var.service_url
    use_common_alert_schema = var.use_common_alert_schema
  }

  azure_app_push_receiver {
    name          = var.azure_app_name
    email_address = var.azure_app_email_address
  }

  azure_function_receiver {
    name                     = var.azure_function_name
    function_app_resource_id = var.azure_function_function_app
    function_name            = var.azure_function_function_name
    http_trigger_url         = var.azure_function_http_trigger
    use_common_alert_schema  = var.azure_function_use_common
  }

  email_receiver {
    name          = var.azure_email_name
    email_address = var.azure_email_email_address
  }
  
  itsm_receiver {
    name                 = var.azure_email_itsm_name
    workspace_id         = var.azure_email_itsm_workspace
    connection_id        = var.azure_email_itsm_connection
    ticket_configuration = var.azure_email_itsm_ticket
    region               = var.azure_email_itsm_region
  }

  logic_app_receiver {
    name                    = var.azure_logic_name
    resource_id             = var.azure_logic_resource
    callback_url            = var.azure_logic_callback
    use_common_alert_schema = var.azure_logic_user_common
  }

  sms_receiver {
    name         = var.azure_sms_name
    country_code = var.azure_sms_country
    phone_number = var.azure_sms_phone
  }

  voice_receiver {
    name         = var.azure_voice_name
    country_code = var.azure_voice_country
    phone_number = var.azure_voice_phone
  }

  webhook_receiver {
    name                    = var.azure_web_name
    service_uri             = var.azure_web_service
    use_common_alert_schema = var.azure_web_use_common
  }
}