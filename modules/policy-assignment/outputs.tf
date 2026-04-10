output "id" {
  description = "Resource ID of the policy assignment."
  value = try(
    azurerm_management_group_policy_assignment.this[0].id,
    azurerm_subscription_policy_assignment.this[0].id,
    azurerm_resource_group_policy_assignment.this[0].id,
    azurerm_resource_policy_assignment.this[0].id,
  )
}

output "name" {
  description = "Name of the policy assignment."
  value       = var.name
}

output "scope_type" {
  description = "Scope type used for the assignment."
  value       = var.scope_type
}
