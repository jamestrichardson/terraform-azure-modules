# Modules

This directory contains reusable Terraform modules for provisioning Azure infrastructure.

## Structure

Each module lives in its own subdirectory and follows this layout:

```
modules/
└── <module-name>/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── README.md
```

Each module directory name is service-oriented and discoverable (for example `container-registry`, `log-analytics`, `postgresql-flexible`).

## Available Modules

| Module | Description |
|--------|-------------|
| `ai-foundry` | Azure AI Foundry hub with supporting Key Vault and Storage Account |
| `azure-openai` | Azure OpenAI account with optional deployments and diagnostics |
| `container-app` | Azure Container App with ingress, probes, and scale rule support |
| `container-apps-environment` | Azure Container Apps Environment with optional storage mounts |
| `container-registry` | Azure Container Registry with optional diagnostics and replication settings |
| `log-analytics` | Azure Log Analytics workspace |
| `postgresql-flexible` | Azure PostgreSQL Flexible Server with optional databases/configuration |
| `static-web-app` | Azure Static Web App with optional custom domain bindings |

## Usage

Refer to the individual module's `README.md` and the corresponding example in the [`examples/`](../examples/) directory for usage guidance.
