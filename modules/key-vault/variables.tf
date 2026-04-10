variable "name" {
  description = "Name of the Key Vault."
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the Key Vault will be created."
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID for the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU. Valid values are standard and premium."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "sku_name must be standard or premium."
  }
}

variable "enable_rbac_authorization" {
  description = "Enable Azure RBAC authorization for the Key Vault."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Enable public network access to the Key Vault."
  type        = bool
  default     = true
}

variable "purge_protection_enabled" {
  description = "Enable purge protection on the Key Vault."
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "Retention period for soft-deleted vault items."
  type        = number
  default     = 90

  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "soft_delete_retention_days must be between 7 and 90."
  }
}

variable "enabled_for_deployment" {
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Allow Azure Disk Encryption to retrieve secrets from the vault."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Allow ARM template deployments to retrieve secrets from the vault."
  type        = bool
  default     = false
}

variable "network_acls" {
  description = "Optional network ACL configuration."
  type = object({
    default_action             = string
    bypass                     = optional(string, "AzureServices")
    ip_rules                   = optional(list(string), [])
    virtual_network_subnet_ids = optional(list(string), [])
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to the Key Vault."
  type        = map(string)
  default     = {}
}
