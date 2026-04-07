output "id" {
  value = azurerm_static_web_app.this.id
}

output "name" {
  value = azurerm_static_web_app.this.name
}

output "default_host_name" {
  description = "The default hostname assigned by Azure (e.g. lively-sky-abc123.azurestaticapps.net)"
  value       = azurerm_static_web_app.this.default_host_name
}

output "api_key" {
  description = "Deployment token used by CI/CD pipelines"
  value       = azurerm_static_web_app.this.api_key
  sensitive   = true
}
