# Storage Account Module

Creates an Azure Storage Account with common security, networking, and identity controls.

## Azure Service Mapping

- Primary service: Azure Storage Account (`azurerm_storage_account`)

## Resources

- `azurerm_storage_account.this`

## Usage

```hcl
module "storage_account" {
  source = "../../modules/storage-account"

  name                = "stplatformdev001"
  location            = "eastus"
  resource_group_name = module.resource_group.name

  account_tier             = "Standard"
  account_replication_type = "ZRS"
  min_tls_version          = "TLS1_2"

  network_rules = {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [module.subnet.id]
  }
}
```

## Notes

- This module does not create containers, shares, or private endpoints so wrappers can compose those concerns independently.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
