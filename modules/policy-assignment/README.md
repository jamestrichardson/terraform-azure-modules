# Policy Assignment Module

Creates an Azure Policy assignment at management group, subscription, resource group, or resource scope.

## Azure Service Mapping

- Primary services:
  - `azurerm_management_group_policy_assignment`
  - `azurerm_subscription_policy_assignment`
  - `azurerm_resource_group_policy_assignment`
  - `azurerm_resource_policy_assignment`

## Resources

- One policy assignment resource, selected by `scope_type`

## Usage

```hcl
module "policy_assignment" {
  source = "../../modules/policy-assignment"

  name                 = "deploy-diag"
  scope_type           = "subscription"
  scope_id             = "/subscriptions/00000000-0000-0000-0000-000000000000"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/00000000-0000-0000-0000-000000000000"
}
```

## Notes

- This module is included as a practical hook for subscription baseline wrappers. Management group hierarchy creation itself is intentionally deferred.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
