variable "location" {
  type    = string
  default = "eastus"
}

variable "name_prefix" {
  type    = string
  default = "demo"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    example     = "azure-openai"
  }
}
