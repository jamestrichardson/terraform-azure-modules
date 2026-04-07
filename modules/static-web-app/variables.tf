variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  description = "SWA is only available in a subset of regions (centralus, eastus2, westus2, etc.)"
  type        = string
}

variable "sku_tier" {
  description = "Free | Standard"
  type        = string
  default     = "Standard"
}

variable "sku_size" {
  description = "Free | Standard"
  type        = string
  default     = "Standard"
}

variable "custom_domains" {
  description = "Map of label → custom domain configuration"
  type = map(object({
    domain_name     = string
    validation_type = string # cname-delegation | dns-txt-token
  }))
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}
