variable "name" {
  description = "Name of the virtual network."
  type        = string
}

variable "location" {
  description = "Azure region for the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the virtual network will be created."
  type        = string
}

variable "address_space" {
  description = "Address space prefixes for the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "Optional custom DNS servers for the virtual network."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the virtual network."
  type        = map(string)
  default     = {}
}
