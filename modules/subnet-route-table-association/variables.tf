variable "subnet_id" {
  description = "Subnet ID to associate."
  type        = string
}

variable "route_table_id" {
  description = "Route table ID to associate to the subnet."
  type        = string
}
