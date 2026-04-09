resource "random_password" "admin" {
  count   = var.administrator_password == null ? 1 : 0
  length  = 32
  special = true
}

locals {
  admin_password = var.administrator_password != null ? var.administrator_password : random_password.admin[0].result
}

resource "azurerm_postgresql_flexible_server" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  version                = var.postgres_version
  administrator_login    = var.administrator_login
  administrator_password = local.admin_password

  sku_name     = var.sku_name
  storage_mb   = var.storage_mb
  storage_tier = var.storage_tier

  backup_retention_days         = var.backup_retention_days
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
  public_network_access_enabled = var.delegated_subnet_id != null ? false : var.public_network_access_enabled
  zone                          = var.zone

  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  dynamic "high_availability" {
    for_each = var.high_availability != null ? [var.high_availability] : []
    content {
      mode                      = high_availability.value.mode
      standby_availability_zone = lookup(high_availability.value, "standby_availability_zone", null)
    }
  }

  dynamic "maintenance_window" {
    for_each = var.maintenance_window != null ? [var.maintenance_window] : []
    content {
      day_of_week  = maintenance_window.value.day_of_week
      start_hour   = maintenance_window.value.start_hour
      start_minute = lookup(maintenance_window.value, "start_minute", 0)
    }
  }

  authentication {
    active_directory_auth_enabled = var.aad_auth_enabled
    password_auth_enabled         = var.password_auth_enabled
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [zone, high_availability[0].standby_availability_zone]
  }
}

# Server-level configuration parameters
resource "azurerm_postgresql_flexible_server_configuration" "this" {
  for_each = var.server_configurations

  name      = each.key
  server_id = azurerm_postgresql_flexible_server.this.id
  value     = each.value
}

# Databases
resource "azurerm_postgresql_flexible_server_database" "this" {
  for_each = var.databases

  name      = each.key
  server_id = azurerm_postgresql_flexible_server.this.id
  charset   = lookup(each.value, "charset", "UTF8")
  collation = lookup(each.value, "collation", "en_US.utf8")
}

# Firewall rules (only relevant when NOT using VNet injection)
resource "azurerm_postgresql_flexible_server_firewall_rule" "this" {
  for_each = var.firewall_rules

  name             = each.key
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}

# Diagnostics
resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.log_analytics_workspace_id != null ? 1 : 0

  name                       = "${var.name}-diag"
  target_resource_id         = azurerm_postgresql_flexible_server.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log { category = "PostgreSQLLogs" }
  enabled_metric {
    category = "AllMetrics"
  }
}
