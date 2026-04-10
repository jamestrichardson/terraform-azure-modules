# Diagnostic Settings Module

Creates a generic Azure Monitor diagnostic setting for any supported Azure resource.

## Azure Service Mapping

- Primary service: Azure Monitor Diagnostic Settings (`azurerm_monitor_diagnostic_setting`)

## Resources

- `azurerm_monitor_diagnostic_setting.this`

## Usage

```hcl
module "diagnostics" {
  source = "../../modules/diagnostic-settings"

  name                       = "acr-diag"
  target_resource_id         = module.container_registry.id
  log_analytics_workspace_id = module.log_analytics.id

  enabled_logs = [
    {
      category = "ContainerRegistryRepositoryEvents"
    },
    {
      category = "ContainerRegistryLoginEvents"
    }
  ]

  metrics = [
    {
      category = "AllMetrics"
    }
  ]
}
```

## Notes

- This module is intentionally generic so wrappers can centralize observability policy without service-specific module branching.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
