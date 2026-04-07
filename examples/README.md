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
| *(none yet)* | Examples will be listed here as they are added. |

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
