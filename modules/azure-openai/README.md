# Azure OpenAI Module

Creates an Azure OpenAI account and optional model deployments.

## Azure Service Mapping

- Primary service: Azure OpenAI via Cognitive Services (`azurerm_cognitive_account`)
- Supporting service: Cognitive Deployment (`azurerm_cognitive_deployment`)

## Resources

- `azurerm_cognitive_account.this`
- `azurerm_cognitive_deployment.this`
- `azurerm_monitor_diagnostic_setting.this` (optional)

## Usage

```hcl
module "azure_openai" {
  source = "../../modules/azure-openai"

  name                    = "aoai-demo-eastus"
  location                = "eastus"
  resource_group_name     = "rg-demo"
  custom_subdomain_name   = "aoai-demo-eastus"
  public_network_access_enabled = true

  deployments = [
    {
      name          = "gpt-4o-mini"
      model_name    = "gpt-4o-mini"
      model_version = "2024-07-18"
      capacity      = 1
    }
  ]

  tags = {
    environment = "dev"
  }
}
```

## Example

- See `examples/azure-openai`

## Notes

- `custom_subdomain_name` must be globally unique.
- Region availability for models and Azure OpenAI differs by subscription and region.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
