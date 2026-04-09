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
    ├── versions.tf
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
| `diagnostic-settings` | Generic Azure Monitor diagnostic settings sink for any supported resource |
| `key-vault` | Azure Key Vault with RBAC and network ACL support |
| `log-analytics` | Azure Log Analytics workspace |
| `network-security-group` | Azure Network Security Group with inline rule objects |
| `policy-assignment` | Azure Policy assignment hook for subscription or management scope baselines |
| `postgresql-flexible` | Azure PostgreSQL Flexible Server with optional databases/configuration |
| `resource-group` | Azure Resource Group wrapper |
| `role-assignment` | Generic Azure RBAC role assignment module |
| `route-table` | Azure Route Table with user-defined routes |
| `storage-account` | Azure Storage Account with security and network controls |
| `static-web-app` | Azure Static Web App with optional custom domain bindings |
| `subnet` | Azure subnet primitive with delegation and service endpoint support |
| `subnet-nsg-association` | Focused subnet-to-NSG association module |
| `subnet-route-table-association` | Focused subnet-to-route-table association module |
| `virtual-network` | Azure Virtual Network foundation primitive |

## Usage

Refer to the individual module `README.md` for usage guidance. The current example catalog covers the original service modules; the new foundation primitives are intended primarily for composition by higher-level platform wrappers.
