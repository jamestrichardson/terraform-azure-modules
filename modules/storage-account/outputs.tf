output "id" {
  description = "Resource ID of the storage account."
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Name of the storage account."
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "primary_dfs_endpoint" {
  description = "Primary Data Lake endpoint."
  value       = azurerm_storage_account.this.primary_dfs_endpoint
}

output "primary_file_endpoint" {
  description = "Primary file endpoint."
  value       = azurerm_storage_account.this.primary_file_endpoint
}

output "primary_queue_endpoint" {
  description = "Primary queue endpoint."
  value       = azurerm_storage_account.this.primary_queue_endpoint
}

output "primary_table_endpoint" {
  description = "Primary table endpoint."
  value       = azurerm_storage_account.this.primary_table_endpoint
}

output "primary_web_endpoint" {
  description = "Primary static website endpoint."
  value       = azurerm_storage_account.this.primary_web_endpoint
}

output "identity" {
  description = "Managed identity block for the storage account."
  value       = try(azurerm_storage_account.this.identity, null)
}
