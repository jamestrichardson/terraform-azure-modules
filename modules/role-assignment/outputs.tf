output "ids" {
  description = "Map of assignment keys to role assignment resource IDs."
  value       = { for key, assignment in azurerm_role_assignment.this : key => assignment.id }
}

output "principal_ids" {
  description = "Map of assignment keys to principal IDs."
  value       = { for key, assignment in azurerm_role_assignment.this : key => assignment.principal_id }
}
