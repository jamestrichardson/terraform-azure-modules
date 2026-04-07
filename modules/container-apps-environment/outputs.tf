output "id" {
  value = azurerm_container_app_environment.this.id
}

output "name" {
  value = azurerm_container_app_environment.this.name
}

output "default_domain" {
  description = "Default domain of the environment (e.g. <unique>.eastus2.azurecontainerapps.io)"
  value       = azurerm_container_app_environment.this.default_domain
}

output "static_ip_address" {
  description = "Static IP of the environment load balancer"
  value       = azurerm_container_app_environment.this.static_ip_address
}
