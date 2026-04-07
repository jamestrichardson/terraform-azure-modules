# Container Apps Environment Module

Creates an Azure Container Apps Environment and optional Azure Files storage mounts.

## Azure Service Mapping

- Primary service: Azure Container Apps Environment (`azurerm_container_app_environment`)
- Supporting service: Environment Storage (`azurerm_container_app_environment_storage`)

## Resources

- `azurerm_container_app_environment.this`
- `azurerm_container_app_environment_storage.shared`

## Usage

```hcl
module "container_apps_environment" {
  source = "../../modules/container-apps-environment"

  name                       = "cae-demo-eastus"
  location                   = "eastus"
  resource_group_name        = "rg-demo"
  log_analytics_workspace_id = module.log_analytics.id

  tags = {
    environment = "dev"
  }
}
```

## Example

- See `examples/container-apps-environment`

## Notes

- `log_analytics_workspace_id` is required by Azure Container Apps environments.
- Set `infrastructure_subnet_id` and `internal_load_balancer_enabled` for private deployments.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
