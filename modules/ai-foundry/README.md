# AI Foundry Module

Creates an Azure AI Foundry hub with required supporting resources.

## Azure Service Mapping

- Primary service: Azure AI Foundry (`azurerm_ai_foundry`)
- Supporting services: Storage Account, Key Vault, Diagnostic Settings

## Resources

- `azurerm_ai_foundry.this`
- `azurerm_storage_account.foundry`
- `azurerm_key_vault.foundry`
- `azurerm_key_vault_access_policy.foundry_hub`
- `azurerm_monitor_diagnostic_setting.this` (optional)

## Usage

```hcl
module "ai_foundry" {
  source = "../../modules/ai-foundry"

  name                  = "aif-demo-eastus"
  location              = "eastus"
  resource_group_name   = "rg-demo"
  tenant_id             = data.azurerm_client_config.current.tenant_id
  storage_account_name  = "aifdemostorage001"
  key_vault_name        = "kv-aif-demo-001"
  log_analytics_workspace_id = null

  tags = {
    environment = "dev"
  }
}
```

## Example

- See `examples/ai-foundry`

## Notes

- `storage_account_name` and `key_vault_name` must be globally unique.
- Enable `key_vault_purge_protection` for production workloads.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
