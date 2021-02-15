data "azurerm_monitor_log_profile" "example" {
  name = "test-logprofile"
}

output "log_profile_storage_account_id" {
  value = data.azurerm_monitor_log_profile.example.storage_account_id
}
