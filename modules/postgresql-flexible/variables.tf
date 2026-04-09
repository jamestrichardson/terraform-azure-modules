variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "postgres_version" {
  type    = string
  default = "16"
}

variable "administrator_login" {
  type    = string
  default = "psqladmin"
}

variable "administrator_password" {
  description = "If null, a random 32-char password is generated"
  type        = string
  default     = null
  sensitive   = true
}

variable "sku_name" {
  description = "e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "storage_tier" {
  description = "P4 | P6 | P10 | P15 | P20 | P30 | P40 | P50 | P60 | P70 | P80"
  type        = string
  default     = "P4"
}

variable "backup_retention_days" {
  type    = number
  default = 7

  validation {
    condition     = var.backup_retention_days >= 7 && var.backup_retention_days <= 35
    error_message = "backup_retention_days must be between 7 and 35."
  }
}

variable "geo_redundant_backup_enabled" {
  type    = bool
  default = false
}

variable "zone" {
  type    = string
  default = null
}

variable "delegated_subnet_id" {
  description = "Subnet ID for private access. null = public access."
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "Required when using delegated_subnet_id"
  type        = string
  default     = null

  validation {
    condition     = var.delegated_subnet_id == null || var.private_dns_zone_id != null
    error_message = "private_dns_zone_id must be set when delegated_subnet_id is provided."
  }
}

variable "public_network_access_enabled" {
  description = "Enable public network access when not using delegated subnet integration."
  type        = bool
  default     = true
}

variable "high_availability" {
  type = object({
    mode                      = string # ZoneRedundant | SameZone
    standby_availability_zone = optional(string)
  })
  default = null
}

variable "maintenance_window" {
  type = object({
    day_of_week  = number
    start_hour   = number
    start_minute = optional(number, 0)
  })
  default = null
}

variable "aad_auth_enabled" {
  type    = bool
  default = false
}

variable "password_auth_enabled" {
  type    = bool
  default = true
}

variable "databases" {
  description = "Map of database name → { charset, collation }"
  type = map(object({
    charset   = optional(string, "UTF8")
    collation = optional(string, "en_US.utf8")
  }))
  default = {}
}

variable "server_configurations" {
  description = "Map of server parameter name → value"
  type        = map(string)
  default     = {}
}

variable "firewall_rules" {
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default = {}
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
