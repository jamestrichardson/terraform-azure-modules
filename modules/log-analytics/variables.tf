variable "name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "sku" {
  description = "SKU of the Log Analytics workspace (PerGB2018 recommended)"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Data retention in days (30–730)"
  type        = number
  default     = 30

  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "retention_in_days must be between 30 and 730."
  }
}

variable "daily_quota_gb" {
  description = "Daily ingestion quota in GB. -1 = unlimited"
  type        = number
  default     = -1
}

variable "reservation_capacity_in_gb_per_day" {
  description = "Reserved capacity commitment in GB per day. null keeps pay-as-you-go behavior."
  type        = number
  default     = null
}

variable "local_authentication_disabled" {
  description = "Disable workspace shared key authentication."
  type        = bool
  default     = false
}

variable "cmk_for_query_forced" {
  description = "Require customer-managed keys for queries when supported."
  type        = bool
  default     = false
}

variable "internet_ingestion_enabled" {
  type    = bool
  default = true
}

variable "internet_query_enabled" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
