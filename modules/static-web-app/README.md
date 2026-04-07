# Static Web App Module

Creates an Azure Static Web App with optional custom domain bindings.

## Azure Service Mapping

- Primary service: Azure Static Web Apps (`azurerm_static_web_app`)
- Supporting service: custom domains (`azurerm_static_web_app_custom_domain`)

## Resources

- `azurerm_static_web_app.this`
- `azurerm_static_web_app_custom_domain.this`

## Usage

```hcl
module "static_web_app" {
  source = "../../modules/static-web-app"

  name                = "swa-demo-eastus2"
  resource_group_name = "rg-demo"
  location            = "eastus2"

  sku_tier = "Free"
  sku_size = "Free"

  tags = {
    environment = "dev"
  }
}
```

## Example

- See `examples/static-web-app`

## Notes

- Static Web Apps are region-limited; verify regional support before deployment.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
