# Subnet Route Table Association Module

Associates an Azure subnet with a route table.

## Azure Service Mapping

- Primary service: Azure subnet/route table association (`azurerm_subnet_route_table_association`)

## Resources

- `azurerm_subnet_route_table_association.this`

## Usage

```hcl
module "subnet_route_table_association" {
  source = "../../modules/subnet-route-table-association"

  subnet_id      = module.subnet.id
  route_table_id = module.route_table.id
}
```

## Notes

- This focused module keeps route attachment explicit and composable for wrapper modules.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
