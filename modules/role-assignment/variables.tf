variable "assignments" {
  description = "Map of role assignments to create."
  type = map(object({
    name                                   = optional(string)
    scope                                  = string
    role_definition_id                     = optional(string)
    role_definition_name                   = optional(string)
    principal_id                           = string
    principal_type                         = optional(string)
    description                            = optional(string)
    condition                              = optional(string)
    condition_version                      = optional(string)
    delegated_managed_identity_resource_id = optional(string)
    skip_service_principal_aad_check       = optional(bool)
  }))
  default = {}

  validation {
    condition = alltrue([
      for assignment in values(var.assignments) :
      (
        (try(assignment.role_definition_id, null) != null && try(assignment.role_definition_name, null) == null) ||
        (try(assignment.role_definition_id, null) == null && try(assignment.role_definition_name, null) != null)
      )
    ])
    error_message = "Each assignment must set exactly one of role_definition_id or role_definition_name."
  }
}
