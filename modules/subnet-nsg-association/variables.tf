variable "subnet_id" {
  description = "Subnet ID to associate."
  type        = string
}

variable "network_security_group_id" {
  description = "Network security group ID to associate to the subnet."
  type        = string
}
