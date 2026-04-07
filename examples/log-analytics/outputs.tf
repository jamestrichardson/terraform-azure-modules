output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "workspace_id" {
  value = module.log_analytics.id
}

output "workspace_name" {
  value = module.log_analytics.name
}
