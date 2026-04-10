# Role Assignment Module

Creates one or more Azure RBAC role assignments.

## Azure Service Mapping

- Primary service: Azure Role Assignments (`azurerm_role_assignment`)

## Resources

- `azurerm_role_assignment.this`

## Usage

```hcl
module "role_assignments" {
  source = "../../modules/role-assignment"

  assignments = {
    container_app_pull = {
      scope                = module.container_registry.id
      role_definition_name = "AcrPull"
      principal_id         = module.container_app.identity[0].principal_id
    }
    key_vault_secrets_user = {
      scope                = module.key_vault.id
      role_definition_name = "Key Vault Secrets User"
      principal_id         = module.container_app.identity[0].principal_id
    }
  }
}
```

## Notes

- The module accepts a map of assignments so wrapper modules can compose RBAC without having to duplicate role assignment resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
