terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
  }
}

resource "azurerm_container_app_environment" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  log_analytics_workspace_id     = var.log_analytics_workspace_id
  infrastructure_subnet_id       = var.infrastructure_subnet_id
  internal_load_balancer_enabled = var.internal_load_balancer_enabled
  zone_redundancy_enabled        = var.zone_redundancy_enabled

  tags = var.tags
}

# Custom domain certificate storage
resource "azurerm_container_app_environment_storage" "shared" {
  for_each = var.storage_mounts

  name                         = each.key
  container_app_environment_id = azurerm_container_app_environment.this.id
  account_name                 = each.value.account_name
  share_name                   = each.value.share_name
  access_key                   = each.value.access_key
  access_mode                  = each.value.access_mode
}
