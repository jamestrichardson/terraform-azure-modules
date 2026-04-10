# PostgreSQL Flexible Server Module

Creates an Azure Database for PostgreSQL Flexible Server with optional databases, configurations, firewall rules, and diagnostics.

## Azure Service Mapping

- Primary service: Azure Database for PostgreSQL Flexible Server (`azurerm_postgresql_flexible_server`)
- Supporting services: server configuration, databases, firewall rules, diagnostic settings

## Resources

- `random_password.admin` (optional)
- `azurerm_postgresql_flexible_server.this`
- `azurerm_postgresql_flexible_server_configuration.this`
- `azurerm_postgresql_flexible_server_database.this`
- `azurerm_postgresql_flexible_server_firewall_rule.this`
- `azurerm_monitor_diagnostic_setting.this` (optional)

## Usage

```hcl
module "postgresql_flexible" {
  source = "../../modules/postgresql-flexible"

  name                = "psql-flex-demo"
  location            = "eastus"
  resource_group_name = "rg-demo"

  sku_name = "B_Standard_B1ms"
  public_network_access_enabled = false

  databases = {
    app = {}
  }

  firewall_rules = {
    office = {
      start_ip_address = "203.0.113.10"
      end_ip_address   = "203.0.113.10"
    }
  }

  tags = {
    environment = "dev"
  }
}
```

## Example

- See `examples/postgresql-flexible`

## Notes

- If `administrator_password` is null, a random password is generated.
- Use delegated subnet and private DNS zone for private networking.
- `server_configurations` now defaults to an empty map so wrapper modules can choose extension and tuning policy explicitly.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- terraform-docs will populate inputs/outputs here -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
