variable "location" {
  type    = string
  default = "eastus2"
}

variable "name_prefix" {
  type    = string
  default = "demo"
}

variable "sku_tier" {
  type    = string
  default = "Free"
}

variable "sku_size" {
  type    = string
  default = "Free"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    example     = "static-web-app"
  }
}
