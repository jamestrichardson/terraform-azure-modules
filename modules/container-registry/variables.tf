variable "name" {
  description = "ACR name (alphanumeric, globally unique, 5–50 chars)"
  type        = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "sku" {
  description = "Basic | Standard | Premium"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be Basic, Standard, or Premium."
  }
}

variable "admin_enabled" {
  description = "Enable admin user. Disable in prod; use managed identity instead."
  type        = bool
  default     = false
}

variable "anonymous_pull_enabled" {
  description = "Allow unauthenticated image pull requests."
  type        = bool
  default     = false
}

variable "data_endpoint_enabled" {
  description = "Enable dedicated data endpoints for data plane traffic."
  type        = bool
  default     = false
}

variable "network_rule_bypass_option" {
  description = "AzureServices or None."
  type        = string
  default     = "AzureServices"

  validation {
    condition     = contains(["AzureServices", "None"], var.network_rule_bypass_option)
    error_message = "network_rule_bypass_option must be AzureServices or None."
  }
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "zone_redundancy_enabled" {
  description = "Requires Premium SKU"
  type        = bool
  default     = false
}

variable "georeplications" {
  description = "List of geo-replication locations (Premium SKU only)"
  type = list(object({
    location                = string
    zone_redundancy_enabled = optional(bool, false)
  }))
  default = []
}

variable "retention_policy_days" {
  description = "Untagged manifest retention days (Premium SKU only). null = disabled."
  type        = number
  default     = null
}

variable "network_rule_set" {
  description = "Optional IP-based network rules for Premium registries."
  type = object({
    default_action = string
    ip_rules = optional(list(object({
      action   = optional(string, "Allow")
      ip_range = string
    })), [])
  })
  default = null
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

variable "log_analytics_workspace_id" {
  description = "Optional Log Analytics workspace to ship diagnostics to"
  type        = string
  default     = null
}

variable "enable_diagnostic_settings" {
  description = "Whether to create diagnostic settings for this registry."
  type        = bool
  default     = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
