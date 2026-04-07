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

variable "internal_load_balancer_enabled" {
  description = "True = internal-only environment (requires subnet)"
  type        = bool
  default     = false
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
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}
