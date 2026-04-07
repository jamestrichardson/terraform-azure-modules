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

variable "log_analytics_workspace_id" {
  description = "Optional Log Analytics workspace to ship diagnostics to"
  type        = string
  default     = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
