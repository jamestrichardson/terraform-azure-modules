# Container Registry Module

Creates an Azure Container Registry with optional diagnostics, retention policy, and geo-replication.

## Azure Service Mapping

- Primary service: Azure Container Registry (`azurerm_container_registry`)

## Resources

- `azurerm_container_registry.this`
- `azurerm_monitor_diagnostic_setting.this` (optional)

## Usage

```hcl
module "container_registry" {
  source = "../../modules/container-registry"

  name                = "acrdemo001"
  location            = "eastus"
  resource_group_name = "rg-demo"
  sku                 = "Standard"

  tags = {
    environment = "dev"
  }
}
```

## Example

- See `examples/container-registry`

## Notes

- ACR names must be globally unique and alphanumeric only.
- Premium SKU is required for geo-replication and retention policy features.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
