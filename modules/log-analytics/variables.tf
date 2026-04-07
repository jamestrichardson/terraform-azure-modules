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
}

variable "daily_quota_gb" {
  description = "Daily ingestion quota in GB. -1 = unlimited"
  type        = number
  default     = -1
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
