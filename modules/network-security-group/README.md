# Network Security Group Module

Creates an Azure Network Security Group with inline security rules.

## Azure Service Mapping

- Primary service: Azure Network Security Group (`azurerm_network_security_group`)

## Resources

- `azurerm_network_security_group.this`

## Usage

```hcl
module "network_security_group" {
  source = "../../modules/network-security-group"

  name                = "nsg-apps"
  location            = "eastus"
  resource_group_name = module.resource_group.name

  security_rules = {
    allow_https_inbound = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "443"
    }
  }
}
```

## Notes

- Rules are defined inline for composability and to keep the backend interface stable for wrappers.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
