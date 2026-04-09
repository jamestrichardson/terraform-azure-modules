# terraform-azure-modules

This repository hosts reusable Terraform modules for Azure infrastructure.

The repository is organized to mirror the style of terraform-aws-modules while staying Azure-service-focused and discoverable.

## Repository Structure

```
terraform-azure-modules/
├── modules/      # Reusable Terraform modules (one directory per Azure service)
├── examples/     # Working examples aligned 1:1 with modules
└── docs/         # Architecture, naming, and contributor-facing documentation
```

## Naming Convention

- Module directory names use lowercase kebab-case and map directly to Azure service names.
- Module names prefer service discoverability over abstraction-heavy naming.
- Examples use the same directory name as the module they demonstrate.

Examples:

- `modules/azure-openai` -> Azure OpenAI (`azurerm_cognitive_account` with `kind = "OpenAI"`)
- `modules/container-registry` -> Azure Container Registry (`azurerm_container_registry`)
- `modules/postgresql-flexible` -> Azure Database for PostgreSQL Flexible Server (`azurerm_postgresql_flexible_server`)

## Modules

See [`modules/`](./modules/) for all available modules and module-level README documentation.

## Available Modules

| Module | Azure Service |
|--------|---------------|
| `ai-foundry` | Azure AI Foundry |
| `azure-openai` | Azure OpenAI |
| `container-app` | Azure Container Apps |
| `container-apps-environment` | Azure Container Apps Environment |
| `container-registry` | Azure Container Registry |
| `diagnostic-settings` | Azure Monitor Diagnostic Settings |
| `key-vault` | Azure Key Vault |
| `log-analytics` | Azure Log Analytics Workspace |
| `network-security-group` | Azure Network Security Group |
| `policy-assignment` | Azure Policy Assignment |
| `postgresql-flexible` | Azure Database for PostgreSQL Flexible Server |
| `resource-group` | Azure Resource Group |
| `role-assignment` | Azure RBAC Role Assignment |
| `route-table` | Azure Route Table |
| `storage-account` | Azure Storage Account |
| `static-web-app` | Azure Static Web Apps |
| `subnet` | Azure Subnet |
| `subnet-nsg-association` | Azure Subnet to NSG Association |
| `subnet-route-table-association` | Azure Subnet to Route Table Association |
| `virtual-network` | Azure Virtual Network |

## Intended Usage

These modules are backend-oriented building blocks for Azure services and platform primitives. They aim to expose stable, typed, provider-facing interfaces that mid-tier modules can wrap with environment conventions, opinionated defaults, composition patterns, and cross-service policy.

## Recommended Mid-Tier Wrappers

| Mid-Tier Wrapper in `teknofile-modules-01` | Backend Modules to Compose |
|--------------------------------------------|----------------------------|
| `azure-platform-resource-group` | `resource-group` |
| `azure-platform-log-analytics` | `log-analytics` |
| `azure-platform-key-vault` | `key-vault`, `role-assignment`, `diagnostic-settings`, `private-endpoint` later if added |
| `azure-platform-storage-account` | `storage-account`, `role-assignment`, `diagnostic-settings` |
| `azure-platform-container-registry` | `container-registry`, `role-assignment`, `diagnostic-settings` |
| `azure-platform-container-apps-environment` | `virtual-network`, `subnet`, `network-security-group`, `subnet-nsg-association`, `container-apps-environment`, `log-analytics`, `diagnostic-settings` |
| `azure-platform-container-app` | `container-app`, `role-assignment`, `key-vault`, `container-registry` |
| `azure-platform-postgresql-flexible` | `subnet`, `network-security-group`, `subnet-nsg-association`, `postgresql-flexible`, `diagnostic-settings` |
| `azure-platform-network-foundation` | `virtual-network`, `subnet`, `network-security-group`, `subnet-nsg-association`, `route-table`, `subnet-route-table-association` |
| `azure-platform-subscription-baseline` | `policy-assignment`, `role-assignment`, `diagnostic-settings` |

## Examples

See [`examples/`](./examples/) for complete, runnable examples.

## Documentation

See [`docs/`](./docs/) for architecture and naming guidance.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for information on how to set up your development environment and contribute to this repository, including configuring the pre-commit hooks.
