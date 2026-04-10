resource "azurerm_cognitive_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "OpenAI"
  sku_name            = var.sku_name

  custom_subdomain_name         = var.custom_subdomain_name
  public_network_access_enabled = var.public_network_access_enabled
  dynamic_throttling_enabled    = var.dynamic_throttling_enabled

  identity {
    type         = var.identity_type
    identity_ids = var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned" ? var.identity_ids : null
  }

  dynamic "network_acls" {
    for_each = var.network_acls != null ? [var.network_acls] : []
    content {
      default_action = network_acls.value.default_action
      ip_rules       = lookup(network_acls.value, "ip_rules", [])

      dynamic "virtual_network_rules" {
        for_each = lookup(network_acls.value, "virtual_network_rules", [])
        content {
          subnet_id                            = virtual_network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = lookup(virtual_network_rules.value, "ignore_missing_vnet_service_endpoint", false)
        }
      }
    }
  }

  tags = var.tags
}

# Deploy model deployments
resource "azurerm_cognitive_deployment" "this" {
  for_each = { for d in var.deployments : d.name => d }

  name                 = each.value.name
  cognitive_account_id = azurerm_cognitive_account.this.id

  model {
    format  = "OpenAI"
    name    = each.value.model_name
    version = each.value.model_version
  }

  sku {
    name     = lookup(each.value, "scale_type", "Standard")
    capacity = lookup(each.value, "capacity", 1)
  }
}

# Diagnostics
resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.log_analytics_workspace_id != null ? 1 : 0

  name                       = "${var.name}-diag"
  target_resource_id         = azurerm_cognitive_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log { category = "Audit" }
  enabled_log { category = "RequestResponse" }
  enabled_metric {
    category = "AllMetrics"
  }
}
