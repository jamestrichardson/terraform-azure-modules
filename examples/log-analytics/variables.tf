variable "location" {
  description = "Azure region for the example deployment"
  type        = string
  default     = "eastus"
}

variable "name_prefix" {
  description = "Short prefix used in generated names"
  type        = string
  default     = "demo"
}

variable "retention_in_days" {
  description = "Retention period to pass to the module"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags applied to resources"
  type        = map(string)
  default = {
    environment = "dev"
    example     = "log-analytics"
  }
}
