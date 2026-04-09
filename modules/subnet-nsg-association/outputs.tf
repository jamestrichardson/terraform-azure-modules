output "id" {
  description = "Resource ID of the subnet-to-NSG association."
  value       = azurerm_subnet_network_security_group_association.this.id
}
