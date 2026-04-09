output "id" {
  description = "Resource ID of the subnet-to-route-table association."
  value       = azurerm_subnet_route_table_association.this.id
}
