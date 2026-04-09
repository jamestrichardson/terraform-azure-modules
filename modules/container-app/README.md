# Container App Module

Creates an Azure Container App with configurable template, ingress, secrets, registry integration, and scale rules.

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

  secrets = [
    {
      name                = "acr-password"
      key_vault_secret_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-demo/providers/Microsoft.KeyVault/vaults/kv-demo/secrets/acr-password"
      identity            = "System"
    }
  ]

  registries = [
    {
      server               = "acrdemo001.azurecr.io"
      username             = "acrdemo001"
      password_secret_name = "acr-password"
    }
  ]

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
- `secrets` support inline values or Key Vault references so higher-level wrappers can keep secret sourcing separate.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
