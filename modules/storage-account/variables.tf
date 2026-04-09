variable "name" {
  description = "Name of the storage account."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the storage account will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the storage account."
  type        = string
}

variable "account_kind" {
  description = "Storage account kind."
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "Storage account performance tier."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "Replication type for the storage account."
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "Access tier for blob storage."
  type        = string
  default     = "Hot"

  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "access_tier must be Hot or Cool."
  }
}

variable "min_tls_version" {
  description = "Minimum TLS version allowed for requests."
  type        = string
  default     = "TLS1_2"

  validation {
    condition     = contains(["TLS1_0", "TLS1_1", "TLS1_2"], var.min_tls_version)
    error_message = "min_tls_version must be TLS1_0, TLS1_1, or TLS1_2."
  }
}

variable "public_network_access_enabled" {
  description = "Enable public network access to the storage account."
  type        = bool
  default     = true
}

variable "shared_access_key_enabled" {
  description = "Allow shared key authorization."
  type        = bool
  default     = true
}

variable "allow_nested_items_to_be_public" {
  description = "Allow containers and blobs to be marked public."
  type        = bool
  default     = false
}

variable "cross_tenant_replication_enabled" {
  description = "Enable object replication across tenants."
  type        = bool
  default     = false
}

variable "https_traffic_only_enabled" {
  description = "Require HTTPS traffic."
  type        = bool
  default     = true
}

variable "infrastructure_encryption_enabled" {
  description = "Enable infrastructure encryption."
  type        = bool
  default     = false
}

variable "is_hns_enabled" {
  description = "Enable hierarchical namespace for Data Lake Storage Gen2."
  type        = bool
  default     = false
}

variable "nfsv3_enabled" {
  description = "Enable NFSv3 support."
  type        = bool
  default     = false
}

variable "sftp_enabled" {
  description = "Enable SFTP support."
  type        = bool
  default     = false
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

variable "network_rules" {
  description = "Optional network rules for the storage account."
  type = object({
    default_action             = string
    bypass                     = optional(list(string), ["AzureServices"])
    ip_rules                   = optional(list(string), [])
    virtual_network_subnet_ids = optional(list(string), [])
  })
  default = null
}

variable "blob_properties" {
  description = "Optional blob service properties."
  type = object({
    change_feed_enabled                    = optional(bool)
    last_access_time_enabled               = optional(bool)
    versioning_enabled                     = optional(bool)
    delete_retention_policy_days           = optional(number)
    container_delete_retention_policy_days = optional(number)
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
  default     = {}
}
