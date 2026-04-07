output "id" {
  value = azurerm_cognitive_account.this.id
}

output "name" {
  value = azurerm_cognitive_account.this.name
}

output "endpoint" {
  description = "The base endpoint URL for API calls"
  value       = azurerm_cognitive_account.this.endpoint
}

output "primary_access_key" {
  value     = azurerm_cognitive_account.this.primary_access_key
  sensitive = true
}

output "secondary_access_key" {
  value     = azurerm_cognitive_account.this.secondary_access_key
  sensitive = true
}

output "identity" {
  value = azurerm_cognitive_account.this.identity
}

output "deployment_ids" {
  description = "Map of deployment name → resource ID"
  value       = { for k, v in azurerm_cognitive_deployment.this : k => v.id }
}
