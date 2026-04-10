# Key Vault Module

Creates an Azure Key Vault with configurable RBAC, retention, and network access settings.

## Azure Service Mapping

- Primary service: Azure Key Vault (`azurerm_key_vault`)

## Resources

- `azurerm_key_vault.this`

## Usage

```hcl
module "key_vault" {
  source = "../../modules/key-vault"

  name                = "kvplatformdev001"
  location            = "eastus"
  resource_group_name = module.resource_group.name
  tenant_id           = var.tenant_id

  enable_rbac_authorization = true
  purge_protection_enabled  = true

  network_acls = {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [module.subnet.id]
  }
}
```

## Notes

- Access policy management is intentionally excluded so higher-level wrappers can standardize on RBAC and compose role assignments separately.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
