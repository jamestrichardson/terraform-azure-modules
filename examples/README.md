# Examples

This directory contains example Terraform configurations that demonstrate how to use the modules in this repository.

## Structure

Each example lives in its own subdirectory and corresponds to one or more modules:

```
examples/
└── <example-name>/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── README.md
```

## Available Examples

| Example | Description |
|---------|-------------|
| `ai-foundry` | AI Foundry hub with supporting resources |
| `azure-openai` | Azure OpenAI account with deployment |
| `container-app` | End-to-end Container Apps stack (workspace + environment + app) |
| `container-apps-environment` | Container Apps Environment with required Log Analytics |
| `container-registry` | Container Registry with diagnostics |
| `log-analytics` | Standalone Log Analytics workspace |
| `postgresql-flexible` | PostgreSQL Flexible Server with database and diagnostics |
| `static-web-app` | Static Web App deployment |

## Running an Example

> **Note:** Examples are intended for reference only and should not be deployed directly into production environments.

1. Navigate to the example directory:
   ```bash
   cd examples/<example-name>
   ```
2. Initialise Terraform:
   ```bash
   terraform init
   ```
3. Review the plan:
   ```bash
   terraform plan
   ```
4. Apply if desired:
   ```bash
   terraform apply
   ```
