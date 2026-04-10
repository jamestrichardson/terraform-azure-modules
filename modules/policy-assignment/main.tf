locals {
  uses_identity = var.identity_type != "None"
}

resource "azurerm_management_group_policy_assignment" "this" {
  count = var.scope_type == "management_group" ? 1 : 0

  name                 = var.name
  management_group_id  = var.scope_id
  policy_definition_id = var.policy_definition_id
  description          = var.description
  display_name         = var.display_name
  enforce              = var.enforce
  location             = local.uses_identity ? var.location : null
  metadata             = var.metadata_json
  not_scopes           = var.not_scopes
  parameters           = var.parameters_json

  dynamic "identity" {
    for_each = local.uses_identity ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }
}

resource "azurerm_subscription_policy_assignment" "this" {
  count = var.scope_type == "subscription" ? 1 : 0

  name                 = var.name
  subscription_id      = var.scope_id
  policy_definition_id = var.policy_definition_id
  description          = var.description
  display_name         = var.display_name
  enforce              = var.enforce
  location             = local.uses_identity ? var.location : null
  metadata             = var.metadata_json
  not_scopes           = var.not_scopes
  parameters           = var.parameters_json

  dynamic "identity" {
    for_each = local.uses_identity ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }
}

resource "azurerm_resource_group_policy_assignment" "this" {
  count = var.scope_type == "resource_group" ? 1 : 0

  name                 = var.name
  resource_group_id    = var.scope_id
  policy_definition_id = var.policy_definition_id
  description          = var.description
  display_name         = var.display_name
  enforce              = var.enforce
  location             = local.uses_identity ? var.location : null
  metadata             = var.metadata_json
  not_scopes           = var.not_scopes
  parameters           = var.parameters_json

  dynamic "identity" {
    for_each = local.uses_identity ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }
}

resource "azurerm_resource_policy_assignment" "this" {
  count = var.scope_type == "resource" ? 1 : 0

  name                 = var.name
  resource_id          = var.scope_id
  policy_definition_id = var.policy_definition_id
  description          = var.description
  display_name         = var.display_name
  enforce              = var.enforce
  location             = local.uses_identity ? var.location : null
  metadata             = var.metadata_json
  not_scopes           = var.not_scopes
  parameters           = var.parameters_json

  dynamic "identity" {
    for_each = local.uses_identity ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }
}
