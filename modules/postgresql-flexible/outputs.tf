output "id" {
  value = azurerm_postgresql_flexible_server.this.id
}

output "name" {
  value = azurerm_postgresql_flexible_server.this.name
}

output "fqdn" {
  value = azurerm_postgresql_flexible_server.this.fqdn
}

output "administrator_login" {
  value = azurerm_postgresql_flexible_server.this.administrator_login
}

output "administrator_password" {
  value     = local.admin_password
  sensitive = true
}

output "database_ids" {
  value = { for k, v in azurerm_postgresql_flexible_server_database.this : k => v.id }
}
