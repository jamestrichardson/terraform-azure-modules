# Virtual Network Module

Creates an Azure Virtual Network.

## Azure Service Mapping

- Primary service: Azure Virtual Network (`azurerm_virtual_network`)

## Resources

- `azurerm_virtual_network.this`

## Usage

```hcl
module "virtual_network" {
  source = "../../modules/virtual-network"

  name                = "vnet-platform-dev"
  location            = "eastus"
  resource_group_name = module.resource_group.name
  address_space       = ["10.20.0.0/16"]
}
```

## Notes

- Subnets are intentionally managed separately so wrappers can own subnet topology explicitly.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
