# Module Naming Convention

This repository uses service-oriented naming for discoverability.

## Rules

- Use lowercase kebab-case.
- Name modules after the Azure service domain, not internal implementation details.
- Keep names concise but unambiguous.
- Prefer one module per primary Azure service responsibility.
- Use matching names for module and example directories.

## Pattern

- Module path: `modules/<service-name>`
- Example path: `examples/<service-name>`

## Current Mapping

| Module Name | Azure Service |
|-------------|---------------|
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

## Adding New Modules

When adding a module:

1. Choose the Azure-service-aligned name.
2. Create the module under `modules/<service-name>/`.
3. Add a matching example under `examples/<service-name>/`.
4. Update module and example indexes in:
   - `modules/README.md`
   - `examples/README.md`
   - root `README.md`
