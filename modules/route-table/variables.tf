variable "name" {
  description = "Name of the route table."
  type        = string
}

variable "location" {
  description = "Azure region for the route table."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the route table will be created."
  type        = string
}

variable "bgp_route_propagation_enabled" {
  description = "Enable BGP route propagation."
  type        = bool
  default     = true
}

variable "routes" {
  description = "Map of routes keyed by route name."
  type = map(object({
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the route table."
  type        = map(string)
  default     = {}
}
