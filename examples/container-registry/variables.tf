variable "location" {
  type    = string
  default = "eastus"
}

variable "name_prefix" {
  type    = string
  default = "demo"
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    example     = "container-registry"
  }
}
