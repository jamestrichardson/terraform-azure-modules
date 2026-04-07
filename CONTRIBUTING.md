# Contributing

Thank you for your interest in contributing to this repository! The following guide explains how to set up your local development environment with pre-commit hooks.

## Prerequisites

| Tool | Minimum Version | Install Guide |
|------|-----------------|---------------|
| [Terraform](https://developer.hashicorp.com/terraform/downloads) | 1.5.0 | `brew install terraform` |
| [terraform-docs](https://terraform-docs.io/user-guide/installation/) | 0.18.0 | `brew install terraform-docs` |
| [tflint](https://github.com/terraform-linters/tflint#installation) | 0.50.0 | `brew install tflint` |
| [trivy](https://aquasecurity.github.io/trivy/latest/getting-started/installation/) | 0.50.0 | `brew install trivy` |
| [pre-commit](https://pre-commit.com/#install) | 3.0.0 | `brew install pre-commit` |

> All tools are also available via `apt`, `pip`, or direct binary downloads for Linux and Windows.

## Setting Up Pre-commit Hooks

This repository uses [pre-commit](https://pre-commit.com/) with [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform) to enforce code quality, formatting, and security checks before every commit.

### 1. Install pre-commit

```bash
pip install pre-commit
# or
brew install pre-commit
```

### 2. Install the hooks

Run the following command from the root of the repository:

```bash
pre-commit install
```

This installs the hooks into your local `.git/hooks/pre-commit` file. The hooks will run automatically on every `git commit`.

### 3. (Optional) Run hooks against all files

To run all hooks against the entire repository without making a commit:

```bash
pre-commit run --all-files
```

## Hooks Configured

The following hooks are configured in [`.pre-commit-config.yaml`](./.pre-commit-config.yaml):

| Hook | Purpose |
|------|---------|
| `trailing-whitespace` | Removes trailing whitespace |
| `end-of-file-fixer` | Ensures files end with a newline |
| `check-merge-conflict` | Detects unresolved merge conflict markers |
| `check-yaml` | Validates YAML file syntax |
| `check-json` | Validates JSON file syntax |
| `mixed-line-ending` | Normalises line endings to LF |
| `terraform_fmt` | Formats Terraform files |
| `terraform_validate` | Validates Terraform configurations |
| `terraform_docs` | Auto-generates module `README.md` documentation |
| `terraform_tflint` | Lints Terraform files |
| `terraform_trivy` | Scans for security issues |
| `terraform_providers_lock` | Ensures provider lock files are up-to-date |

## Adding a New Module

1. Create a directory under `modules/<module-name>/`.
2. Add the standard Terraform files (`main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`).
3. Add a `README.md` containing the terraform-docs placeholder:

   ```markdown
   <!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
   <!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
   ```

4. Add a corresponding example under `examples/<module-name>/`.
5. Update `modules/README.md` to list the new module.
