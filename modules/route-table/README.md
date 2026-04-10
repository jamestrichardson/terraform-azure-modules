# Route Table Module

Creates an Azure Route Table with optional user-defined routes.

## Azure Service Mapping

- Primary service: Azure Route Table (`azurerm_route_table`)

## Resources

- `azurerm_route_table.this`

## Usage

```hcl
module "route_table" {
  source = "../../modules/route-table"

  name                = "rt-apps"
  location            = "eastus"
  resource_group_name = module.resource_group.name

  routes = {
    default_to_firewall = {
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.20.254.4"
    }
  }
}
```

## Notes

- Route tables are included because mid-tier platform wrappers often need optional egress and inspection topology without forcing every subnet to use one.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
