terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "this" {
  name     = "rg-aca-${var.name_prefix}-${random_string.suffix.result}"
  location = var.location
}

module "log_analytics" {
  source = "../../modules/log-analytics"

  name                = "law${var.name_prefix}${random_string.suffix.result}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
}

module "container_apps_environment" {
  source = "../../modules/container-apps-environment"

  name                       = "cae-${var.name_prefix}-${random_string.suffix.result}"
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  log_analytics_workspace_id = module.log_analytics.id
  tags                       = var.tags
}

module "container_app" {
  source = "../../modules/container-app"

  name                         = "aca-${var.name_prefix}-${random_string.suffix.result}"
  resource_group_name          = azurerm_resource_group.this.name
  container_app_environment_id = module.container_apps_environment.id

  containers = [
    {
      name   = "web"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.5
      memory = "1Gi"
      env = [
        {
          name  = "WEBSITE_HOSTNAME"
          value = "example.local"
        }
      ]
    }
  ]

  ingress = {
    external_enabled = true
    target_port      = 80
  }

  tags = var.tags
}
