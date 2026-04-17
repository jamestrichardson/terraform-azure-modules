variable "name" {
  description = "Name for the AI Foundry Hub resource"
  type        = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID (used for Key Vault)"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the supporting storage account (3–24 chars, lowercase alphanumeric)"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the supporting Key Vault (3–24 chars, globally unique)"
  type        = string
}

variable "key_vault_purge_protection" {
  description = "Enable purge protection on the Key Vault (recommended for prod)"
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "enable_diagnostic_settings" {
  description = "Whether to create diagnostic settings for this AI Foundry hub."
  type        = bool
  default     = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
