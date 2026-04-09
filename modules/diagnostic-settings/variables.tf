variable "name" {
  description = "Name of the diagnostic setting."
  type        = string
}

variable "target_resource_id" {
  description = "Resource ID to apply diagnostics to."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Optional Log Analytics workspace destination."
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "Optional storage account destination."
  type        = string
  default     = null
}

variable "eventhub_authorization_rule_id" {
  description = "Optional Event Hub authorization rule destination."
  type        = string
  default     = null
}

variable "eventhub_name" {
  description = "Optional Event Hub name when sending diagnostics to Event Hub."
  type        = string
  default     = null
}

variable "log_analytics_destination_type" {
  description = "Destination type for Log Analytics. null lets Azure choose defaults."
  type        = string
  default     = null
}

variable "enabled_logs" {
  description = "Log categories or category groups to enable."
  type = list(object({
    category       = optional(string)
    category_group = optional(string)
    retention_policy = optional(object({
      enabled = bool
      days    = number
    }))
  }))
  default = []

  validation {
    condition = alltrue([
      for item in var.enabled_logs :
      (
        (try(item.category, null) != null && try(item.category_group, null) == null) ||
        (try(item.category, null) == null && try(item.category_group, null) != null)
      )
    ])
    error_message = "Each enabled_logs entry must set exactly one of category or category_group."
  }
}

variable "metrics" {
  description = "Metric categories to enable."
  type = list(object({
    category = string
  }))
  default = []
}
