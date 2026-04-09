# Subnet Module

Creates an Azure subnet with optional service endpoints and delegations.

## Azure Service Mapping

- Primary service: Azure Subnet (`azurerm_subnet`)

## Resources

- `azurerm_subnet.this`

## Usage

```hcl
module "subnet" {
  source = "../../modules/subnet"

  name                 = "snet-apps"
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = ["10.20.1.0/24"]

  delegations = [
    {
      name                    = "postgres-flex"
      service_delegation_name = "Microsoft.DBforPostgreSQL/flexibleServers"
    }
  ]
}
```

## Notes

- NSG and route table attachment are kept in separate association modules to avoid hidden coupling.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
