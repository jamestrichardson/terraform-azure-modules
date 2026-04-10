resource "azurerm_role_assignment" "this" {
  for_each = var.assignments

  name                                   = lookup(each.value, "name", null)
  scope                                  = each.value.scope
  role_definition_id                     = lookup(each.value, "role_definition_id", null)
  role_definition_name                   = lookup(each.value, "role_definition_name", null)
  principal_id                           = each.value.principal_id
  principal_type                         = lookup(each.value, "principal_type", null)
  description                            = lookup(each.value, "description", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}
