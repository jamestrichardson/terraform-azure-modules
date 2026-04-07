terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}

resource "azurerm_static_web_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_tier = var.sku_tier
  sku_size = var.sku_size

  tags = var.tags
}

# App settings (environment variables surfaced to the SWA build/runtime)
resource "azurerm_static_web_app_custom_domain" "this" {
  for_each = var.custom_domains

  static_web_app_id = azurerm_static_web_app.this.id
  domain_name       = each.value.domain_name
  validation_type   = each.value.validation_type # cname-delegation | dns-txt-token
}
