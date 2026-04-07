# Container App Module

Creates an Azure Container App with configurable template, ingress, secrets, and scale rules.

## Azure Service Mapping

- Primary service: Azure Container Apps (`azurerm_container_app`)

## Resources

- `azurerm_container_app.this`

## Usage

```hcl
module "container_app" {
  source = "../../modules/container-app"

  name                         = "aca-api-demo"
  resource_group_name          = "rg-demo"
  container_app_environment_id = module.container_apps_environment.id

  containers = [
    {
      name   = "api"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.5
      memory = "1Gi"
    }
  ]

  ingress = {
    external_enabled = true
    target_port      = 80
  }

  tags = {
    environment = "dev"
  }
}
```

## Example

- See `examples/container-app`

## Notes

- Requires an existing Container Apps Environment.
- Use `identity_type = "SystemAssigned"` or user-assigned identities for secure service integrations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
