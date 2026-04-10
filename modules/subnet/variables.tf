variable "name" {
  description = "Name of the subnet."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name containing the virtual network."
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual network name containing the subnet."
  type        = string
}

variable "address_prefixes" {
  description = "Address prefixes for the subnet."
  type        = list(string)
}

variable "service_endpoints" {
  description = "Optional service endpoints to enable on the subnet."
  type        = list(string)
  default     = []
}

variable "service_endpoint_policy_ids" {
  description = "Optional service endpoint policy IDs to associate."
  type        = list(string)
  default     = []
}

variable "private_endpoint_network_policies_enabled" {
  description = "Enable subnet network policies for private endpoints."
  type        = bool
  default     = true
}

variable "private_link_service_network_policies_enabled" {
  description = "Enable subnet network policies for private link services."
  type        = bool
  default     = true
}

variable "delegations" {
  description = "Optional subnet delegations."
  type = list(object({
    name                    = string
    service_delegation_name = string
    actions                 = optional(list(string))
  }))
  default = []
}
