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
  name     = "rg-psql-${var.name_prefix}-${random_string.suffix.result}"
  location = var.location
}

module "log_analytics" {
  source = "../../modules/log-analytics"

  name                = "law${var.name_prefix}${random_string.suffix.result}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
}

module "postgresql_flexible" {
  source = "../../modules/postgresql-flexible"

  name                       = "psql-${var.name_prefix}-${random_string.suffix.result}"
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  administrator_login        = "psqladmin"
  sku_name                   = "B_Standard_B1ms"
  log_analytics_workspace_id = module.log_analytics.id

  databases = {
    app = {}
  }

  firewall_rules = {
    allow_all_azure = {
      start_ip_address = "0.0.0.0"
      end_ip_address   = "0.0.0.0"
    }
  }

  tags = var.tags
}
