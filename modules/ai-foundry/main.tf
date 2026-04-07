terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}

# Storage account required by the Foundry Hub
resource "azurerm_storage_account" "foundry" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

# Key Vault required by the Foundry Hub
resource "azurerm_key_vault" "foundry" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  purge_protection_enabled   = var.key_vault_purge_protection
  soft_delete_retention_days = 7

  tags = var.tags
}

# AI Foundry Hub (azurerm 4.x resource)
resource "azurerm_ai_foundry" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  storage_account_id = azurerm_storage_account.foundry.id
  key_vault_id       = azurerm_key_vault.foundry.id

  # Wire to the Azure OpenAI endpoint if provided
  # (connections are managed via azurerm_ai_foundry_connection separately)

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

# Grant the Hub's managed identity access to Key Vault
resource "azurerm_key_vault_access_policy" "foundry_hub" {
  key_vault_id = azurerm_key_vault.foundry.id
  tenant_id    = azurerm_ai_foundry.this.identity[0].tenant_id
  object_id    = azurerm_ai_foundry.this.identity[0].principal_id

  key_permissions    = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
}

# Diagnostics
resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.log_analytics_workspace_id != null ? 1 : 0

  name                       = "${var.name}-diag"
  target_resource_id         = azurerm_ai_foundry.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log { category = "AmlComputeJobEvent" }
  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
