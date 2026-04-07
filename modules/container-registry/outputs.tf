output "id" {
  value = azurerm_container_registry.this.id
}

output "name" {
  value = azurerm_container_registry.this.name
}

output "login_server" {
  description = "The URL to use for Docker login (e.g. myregistry.azurecr.io)"
  value       = azurerm_container_registry.this.login_server
}

output "admin_username" {
  value     = azurerm_container_registry.this.admin_username
  sensitive = true
}

output "admin_password" {
  value     = azurerm_container_registry.this.admin_password
  sensitive = true
}
