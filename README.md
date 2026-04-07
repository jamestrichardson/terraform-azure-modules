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
| `log-analytics` | Azure Log Analytics Workspace |
| `postgresql-flexible` | Azure Database for PostgreSQL Flexible Server |
| `static-web-app` | Azure Static Web Apps |

## Examples

See [`examples/`](./examples/) for complete, runnable examples.

## Documentation

See [`docs/`](./docs/) for architecture and naming guidance.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for information on how to set up your development environment and contribute to this repository, including configuring the pre-commit hooks.
