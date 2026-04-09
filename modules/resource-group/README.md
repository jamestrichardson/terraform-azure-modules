# Resource Group Module

Creates an Azure Resource Group.

## Azure Service Mapping

- Primary service: Azure Resource Groups (`azurerm_resource_group`)

## Resources

- `azurerm_resource_group.this`

## Usage

```hcl
module "resource_group" {
  source = "../../modules/resource-group"

  name     = "rg-platform-dev-eastus"
  location = "eastus"

  tags = {
    environment = "dev"
  }
}
```

## Notes

- This is intentionally thin so higher-level wrappers can own naming standards and placement policy.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
