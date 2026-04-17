resource "azurerm_container_app_environment" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  log_analytics_workspace_id         = var.log_analytics_workspace_id
  infrastructure_subnet_id           = var.infrastructure_subnet_id
  infrastructure_resource_group_name = var.infrastructure_resource_group_name
  internal_load_balancer_enabled     = var.infrastructure_subnet_id != null ? var.internal_load_balancer_enabled : null
  zone_redundancy_enabled            = var.infrastructure_subnet_id != null ? var.zone_redundancy_enabled : null

  dynamic "workload_profile" {
    for_each = var.workload_profiles
    content {
      name                  = workload_profile.value.name
      workload_profile_type = workload_profile.value.workload_profile_type
      minimum_count         = lookup(workload_profile.value, "minimum_count", null)
      maximum_count         = lookup(workload_profile.value, "maximum_count", null)
    }
  }

  tags = var.tags
}

# Custom domain certificate storage
resource "azurerm_container_app_environment_storage" "shared" {
  for_each = toset(nonsensitive(keys(var.storage_mounts)))

  name                         = each.value
  container_app_environment_id = azurerm_container_app_environment.this.id
  account_name                 = var.storage_mounts[each.value].account_name
  share_name                   = var.storage_mounts[each.value].share_name
  access_key                   = var.storage_mounts[each.value].access_key
  access_mode                  = var.storage_mounts[each.value].access_mode
}
