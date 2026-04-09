output "id" {
  value = azurerm_container_registry.this.id
}

output "name" {
  value = azurerm_container_registry.this.name
}

output "resource_group_name" {
  value = azurerm_container_registry.this.resource_group_name
}

output "location" {
  value = azurerm_container_registry.this.location
}

output "sku" {
  value = azurerm_container_registry.this.sku
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

output "identity" {
  value = try(azurerm_container_registry.this.identity, null)
}
