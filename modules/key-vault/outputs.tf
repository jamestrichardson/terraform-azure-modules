output "id" {
  description = "Resource ID of the Key Vault."
  value       = azurerm_key_vault.this.id
}

output "name" {
  description = "Name of the Key Vault."
  value       = azurerm_key_vault.this.name
}

output "vault_uri" {
  description = "DNS URI of the Key Vault."
  value       = azurerm_key_vault.this.vault_uri
}

output "resource_group_name" {
  description = "Resource group name of the Key Vault."
  value       = azurerm_key_vault.this.resource_group_name
}
