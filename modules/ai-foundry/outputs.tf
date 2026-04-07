output "id" {
  value = azurerm_ai_foundry.this.id
}

output "name" {
  value = azurerm_ai_foundry.this.name
}

output "hub_id" {
  description = "Alias of id — used when referencing parent_hub_id in project modules"
  value       = azurerm_ai_foundry.this.id
}

output "identity" {
  description = "Managed identity block (principal_id, tenant_id)"
  value       = azurerm_ai_foundry.this.identity
}

output "key_vault_id" {
  value = azurerm_key_vault.foundry.id
}

output "storage_account_id" {
  value = azurerm_storage_account.foundry.id
}
