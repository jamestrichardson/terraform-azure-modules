variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace resource ID for platform logs"
  type        = string
}

variable "infrastructure_subnet_id" {
  description = "Subnet ID for VNet injection. null = consumption-plan (public)"
  type        = string
  default     = null
}

variable "infrastructure_resource_group_name" {
  description = "Optional infrastructure resource group name used by Azure for the managed environment."
  type        = string
  default     = null
}

variable "internal_load_balancer_enabled" {
  description = "True = internal-only environment (requires subnet)"
  type        = bool
  default     = false

  validation {
    condition     = !var.internal_load_balancer_enabled || var.infrastructure_subnet_id != null
    error_message = "internal_load_balancer_enabled requires infrastructure_subnet_id to be set."
  }
}

variable "zone_redundancy_enabled" {
  type    = bool
  default = false
}

variable "storage_mounts" {
  description = "Map of Azure Files shares to mount into the environment"
  type = map(object({
    account_name = string
    share_name   = string
    access_key   = string
    access_mode  = string # ReadWrite | ReadOnly
  }))
  default   = {}
  sensitive = true
}

variable "workload_profiles" {
  description = "Optional workload profiles for dedicated or consumption-based Container Apps environments."
  type = list(object({
    name                  = string
    workload_profile_type = string
    minimum_count         = optional(number)
    maximum_count         = optional(number)
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
