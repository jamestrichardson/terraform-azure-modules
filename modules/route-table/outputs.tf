output "id" {
  description = "Resource ID of the route table."
  value       = azurerm_route_table.this.id
}

output "name" {
  description = "Name of the route table."
  value       = azurerm_route_table.this.name
}
