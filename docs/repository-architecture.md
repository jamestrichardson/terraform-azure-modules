# Repository Architecture

This repository separates reusable modules, runnable examples, and documentation to keep contributor workflows clear and module discovery easy.

## Directory Responsibilities

- `modules/`: reusable Terraform modules for Azure services.
- `examples/`: complete example stacks that demonstrate how to use modules.
- `docs/`: architecture and contributor documentation.

## Module Contract

Each module should contain:

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`
- `README.md`

Module README requirements:

- What the module creates.
- Which Azure service(s) it maps to.
- A minimal usage block.
- Link to corresponding example directory.
- Terraform docs hook block for auto-generated inputs/outputs.

## Example Contract

Each example should contain:

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `README.md`

Examples should be runnable with standard Terraform commands and include realistic wiring for dependent Azure resources.

## Documentation Workflow

- Keep hand-written module context at the top of each module README.
- Keep the terraform-docs hook block in place for generated input/output docs.
- Update top-level catalogs whenever modules/examples are added or renamed.
