resource "azurerm_monitor_diagnostic_setting" "this" {
  name                           = var.name
  target_resource_id             = var.target_resource_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  storage_account_id             = var.storage_account_id
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  eventhub_name                  = var.eventhub_name
  log_analytics_destination_type = var.log_analytics_destination_type

  dynamic "enabled_log" {
    for_each = var.enabled_logs
    content {
      category       = lookup(enabled_log.value, "category", null)
      category_group = lookup(enabled_log.value, "category_group", null)

      dynamic "retention_policy" {
        for_each = lookup(enabled_log.value, "retention_policy", null) == null ? [] : [enabled_log.value.retention_policy]
        content {
          enabled = retention_policy.value.enabled
          days    = retention_policy.value.days
        }
      }
    }
  }

  dynamic "enabled_metric" {
    for_each = var.metrics
    content {
      category = enabled_metric.value.category
    }
  }

  lifecycle {
    precondition {
      condition = anytrue([
        var.log_analytics_workspace_id != null,
        var.storage_account_id != null,
        var.eventhub_authorization_rule_id != null,
      ])
      error_message = "At least one destination must be set: log_analytics_workspace_id, storage_account_id, or eventhub_authorization_rule_id."
    }

    precondition {
      condition     = length(var.enabled_logs) > 0 || length(var.metrics) > 0
      error_message = "At least one enabled_logs or metrics entry must be provided."
    }
  }
}
