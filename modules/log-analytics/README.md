# Log Analytics Module

Creates an Azure Log Analytics workspace for diagnostics and observability, with optional authentication and capacity controls.

## Azure Service Mapping

- Primary service: Azure Log Analytics Workspace (`azurerm_log_analytics_workspace`)

## Resources

- `azurerm_log_analytics_workspace.this`

## Usage

```hcl
module "log_analytics" {
  source = "../../modules/log-analytics"

  name                = "law-demo-eastus"
  location            = "eastus"
  resource_group_name = "rg-demo"

  retention_in_days = 30
  local_authentication_disabled = true

  tags = {
    environment = "dev"
  }
}
```

## Example

- See `examples/log-analytics`

## Notes

- Use this module as a shared dependency for module diagnostics settings.
- Shared key auth can be disabled with `local_authentication_disabled` when wrappers prefer Azure RBAC and managed identity access patterns.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
