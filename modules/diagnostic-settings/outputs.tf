output "id" {
  description = "Resource ID of the diagnostic setting."
  value       = azurerm_monitor_diagnostic_setting.this.id
}

output "name" {
  description = "Name of the diagnostic setting."
  value       = azurerm_monitor_diagnostic_setting.this.name
}

output "target_resource_id" {
  description = "Target resource ID of the diagnostic setting."
  value       = azurerm_monitor_diagnostic_setting.this.target_resource_id
}
