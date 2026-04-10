variable "name" {
  description = "Name of the policy assignment."
  type        = string
}

variable "scope_type" {
  description = "Scope type for the assignment: management_group, subscription, resource_group, or resource."
  type        = string

  validation {
    condition     = contains(["management_group", "subscription", "resource_group", "resource"], var.scope_type)
    error_message = "scope_type must be management_group, subscription, resource_group, or resource."
  }
}

variable "scope_id" {
  description = "Scope ID to assign the policy to."
  type        = string
}

variable "policy_definition_id" {
  description = "Policy or initiative definition ID to assign."
  type        = string
}

variable "display_name" {
  description = "Optional display name for the assignment."
  type        = string
  default     = null
}

variable "description" {
  description = "Optional description for the assignment."
  type        = string
  default     = null
}

variable "location" {
  description = "Location required when the assignment uses a managed identity."
  type        = string
  default     = null
}

variable "enforce" {
  description = "Whether the assignment is enforced."
  type        = bool
  default     = true
}

variable "not_scopes" {
  description = "Scopes excluded from the assignment."
  type        = list(string)
  default     = []
}

variable "parameters_json" {
  description = "JSON string of assignment parameters."
  type        = string
  default     = null
}

variable "metadata_json" {
  description = "JSON string of assignment metadata."
  type        = string
  default     = null
}

variable "identity_type" {
  description = "None | SystemAssigned | UserAssigned | SystemAssigned, UserAssigned"
  type        = string
  default     = "None"

  validation {
    condition = contains(
      ["None", "SystemAssigned", "UserAssigned", "SystemAssigned, UserAssigned"],
      var.identity_type
    )
    error_message = "identity_type must be None, SystemAssigned, UserAssigned, or SystemAssigned, UserAssigned."
  }
}

variable "identity_ids" {
  description = "User-assigned identity IDs to attach when using a user-assigned identity type."
  type        = list(string)
  default     = []
}
