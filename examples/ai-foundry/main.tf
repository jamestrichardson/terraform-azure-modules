terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
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

data "azurerm_client_config" "current" {}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "this" {
  name     = "rg-aif-${var.name_prefix}-${random_string.suffix.result}"
  location = var.location
}

module "log_analytics" {
  source = "../../modules/log-analytics"

  name                = "law${var.name_prefix}${random_string.suffix.result}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
}

module "ai_foundry" {
  source = "../../modules/ai-foundry"

  name                       = "aif-${var.name_prefix}-${random_string.suffix.result}"
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  storage_account_name       = "aif${var.name_prefix}${random_string.suffix.result}"
  key_vault_name             = "kv-aif-${var.name_prefix}-${random_string.suffix.result}"
  enable_diagnostic_settings = true
  log_analytics_workspace_id = module.log_analytics.id

  tags = var.tags
}
