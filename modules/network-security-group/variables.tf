variable "name" {
  description = "Name of the network security group."
  type        = string
}

variable "location" {
  description = "Azure region for the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the NSG will be created."
  type        = string
}

variable "security_rules" {
  description = "Map of security rule definitions keyed by rule name."
  type = map(object({
    priority                                   = number
    direction                                  = string
    access                                     = string
    protocol                                   = string
    description                                = optional(string)
    source_port_range                          = optional(string)
    source_port_ranges                         = optional(list(string))
    destination_port_range                     = optional(string)
    destination_port_ranges                    = optional(list(string))
    source_address_prefix                      = optional(string)
    source_address_prefixes                    = optional(list(string))
    destination_address_prefix                 = optional(string)
    destination_address_prefixes               = optional(list(string))
    source_application_security_group_ids      = optional(list(string))
    destination_application_security_group_ids = optional(list(string))
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the network security group."
  type        = map(string)
  default     = {}
}
