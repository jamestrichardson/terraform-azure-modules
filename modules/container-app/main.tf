terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
  }
}

resource "azurerm_container_app" "this" {
  name                         = var.name
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = var.revision_mode

  template {
    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    dynamic "container" {
      for_each = var.containers
      content {
        name    = container.value.name
        image   = container.value.image
        cpu     = container.value.cpu
        memory  = container.value.memory
        command = lookup(container.value, "command", null)
        args    = lookup(container.value, "args", null)

        dynamic "env" {
          for_each = lookup(container.value, "env", [])
          content {
            name        = env.value.name
            value       = lookup(env.value, "value", null)
            secret_name = lookup(env.value, "secret_name", null)
          }
        }

        dynamic "volume_mounts" {
          for_each = lookup(container.value, "volume_mounts", [])
          content {
            name = volume_mounts.value.name
            path = volume_mounts.value.path
          }
        }

        dynamic "liveness_probe" {
          for_each = lookup(container.value, "liveness_probe", null) != null ? [container.value.liveness_probe] : []
          content {
            transport               = liveness_probe.value.transport
            path                    = lookup(liveness_probe.value, "path", null)
            port                    = liveness_probe.value.port
            initial_delay           = lookup(liveness_probe.value, "initial_delay", 10)
            interval_seconds        = lookup(liveness_probe.value, "interval_seconds", 10)
            failure_count_threshold = lookup(liveness_probe.value, "failure_count_threshold", 3)
          }
        }

        dynamic "readiness_probe" {
          for_each = lookup(container.value, "readiness_probe", null) != null ? [container.value.readiness_probe] : []
          content {
            transport               = readiness_probe.value.transport
            path                    = lookup(readiness_probe.value, "path", null)
            port                    = readiness_probe.value.port
            interval_seconds        = lookup(readiness_probe.value, "interval_seconds", 5)
            failure_count_threshold = lookup(readiness_probe.value, "failure_count_threshold", 3)
          }
        }
      }
    }

    dynamic "volume" {
      for_each = var.volumes
      content {
        name         = volume.value.name
        storage_type = volume.value.storage_type
        storage_name = lookup(volume.value, "storage_name", null)
      }
    }

    dynamic "http_scale_rule" {
      for_each = var.http_scale_rules
      content {
        name                = http_scale_rule.value.name
        concurrent_requests = http_scale_rule.value.concurrent_requests
      }
    }

    dynamic "custom_scale_rule" {
      for_each = var.custom_scale_rules
      content {
        name             = custom_scale_rule.value.name
        custom_rule_type = custom_scale_rule.value.custom_rule_type
        metadata         = custom_scale_rule.value.metadata
      }
    }
  }

  dynamic "ingress" {
    for_each = var.ingress != null ? [var.ingress] : []
    content {
      external_enabled           = lookup(ingress.value, "external_enabled", true)
      target_port                = ingress.value.target_port
      transport                  = lookup(ingress.value, "transport", "auto")
      allow_insecure_connections = lookup(ingress.value, "allow_insecure_connections", false)

      dynamic "traffic_weight" {
        for_each = lookup(ingress.value, "traffic_weights", [{ latest_revision = true, percentage = 100 }])
        content {
          label           = lookup(traffic_weight.value, "label", null)
          revision_suffix = lookup(traffic_weight.value, "revision_suffix", null)
          latest_revision = lookup(traffic_weight.value, "latest_revision", false)
          percentage      = traffic_weight.value.percentage
        }
      }
    }
  }

  dynamic "secret" {
    for_each = var.secrets
    content {
      name  = secret.value.name
      value = secret.value.value
    }
  }

  dynamic "registry" {
    for_each = var.registries
    content {
      server               = registry.value.server
      username             = lookup(registry.value, "username", null)
      password_secret_name = lookup(registry.value, "password_secret_name", null)
      identity             = lookup(registry.value, "identity", null)
    }
  }

  identity {
    type         = var.identity_type
    identity_ids = var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned" ? var.identity_ids : null
  }

  tags = var.tags
}
