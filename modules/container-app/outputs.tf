output "id" {
  value = azurerm_container_app.this.id
}

output "name" {
  value = azurerm_container_app.this.name
}

output "fqdn" {
  description = "The fully qualified domain name of the ingress (null if no ingress)"
  value       = try(azurerm_container_app.this.ingress[0].fqdn, null)
}

output "outbound_ip_addresses" {
  value = azurerm_container_app.this.outbound_ip_addresses
}

output "identity" {
  description = "Managed identity block (principal_id, tenant_id)"
  value       = azurerm_container_app.this.identity
}

output "latest_revision_name" {
  value = azurerm_container_app.this.latest_revision_name
}
