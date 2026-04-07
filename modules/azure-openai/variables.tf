variable "name" {
  type = string
}

variable "location" {
  description = "Azure OpenAI is only available in select regions (e.g. eastus, westeurope)"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  description = "S0 is the only generally available SKU for Azure OpenAI"
  type        = string
  default     = "S0"
}

variable "custom_subdomain_name" {
  description = "Required for AAD authentication. Must be globally unique."
  type        = string
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "dynamic_throttling_enabled" {
  type    = bool
  default = false
}

variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}

variable "identity_ids" {
  type    = list(string)
  default = []
}

variable "deployments" {
  description = "List of model deployments to create under this account"
  type = list(object({
    name          = string
    model_name    = string
    model_version = string
    scale_type    = optional(string, "Standard")
    capacity      = optional(number, 1) # TPM in thousands
  }))
  default = []
}

variable "network_acls" {
  description = "Network ACLs. null = allow all."
  type = object({
    default_action = string
    ip_rules       = optional(list(string), [])
    virtual_network_rules = optional(list(object({
      subnet_id                            = string
      ignore_missing_vnet_service_endpoint = optional(bool, false)
    })), [])
  })
  default = null
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
