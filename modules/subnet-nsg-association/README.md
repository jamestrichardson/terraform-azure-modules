# Subnet NSG Association Module

Associates an Azure subnet with a Network Security Group.

## Azure Service Mapping

- Primary service: Azure Subnet/NSG association (`azurerm_subnet_network_security_group_association`)

## Resources

- `azurerm_subnet_network_security_group_association.this`

## Usage

```hcl
module "subnet_nsg_association" {
  source = "../../modules/subnet-nsg-association"

  subnet_id                 = module.subnet.id
  network_security_group_id = module.network_security_group.id
}
```

## Notes

- Keeping associations separate makes wrapper behavior explicit and easier to reuse across subnet patterns.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
