output "id" {
  description = "Resource ID of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.this.id
}

output "name" {
  value = azurerm_log_analytics_workspace.this.name
}

output "location" {
  value = azurerm_log_analytics_workspace.this.location
}

output "resource_group_name" {
  value = azurerm_log_analytics_workspace.this.resource_group_name
}

output "workspace_id" {
  description = "The workspace (customer) ID — used by diagnostics settings"
  value       = azurerm_log_analytics_workspace.this.workspace_id
}

output "primary_shared_key" {
  description = "Primary shared key (sensitive)"
  value       = azurerm_log_analytics_workspace.this.primary_shared_key
  sensitive   = true
}
