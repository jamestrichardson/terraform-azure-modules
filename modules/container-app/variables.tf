variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "container_app_environment_id" {
  type = string
}

variable "revision_mode" {
  description = "Single | Multiple"
  type        = string
  default     = "Single"
}

variable "min_replicas" {
  type    = number
  default = 0
}

variable "max_replicas" {
  type    = number
  default = 3
}

variable "containers" {
  description = "List of container definitions"
  type = list(object({
    name    = string
    image   = string
    cpu     = number
    memory  = string
    command = optional(list(string))
    args    = optional(list(string))
    env = optional(list(object({
      name        = string
      value       = optional(string)
      secret_name = optional(string)
    })), [])
    volume_mounts = optional(list(object({
      name = string
      path = string
    })), [])
    liveness_probe = optional(object({
      transport               = string
      path                    = optional(string)
      port                    = number
      initial_delay           = optional(number, 10)
      interval_seconds        = optional(number, 10)
      failure_count_threshold = optional(number, 3)
    }))
    readiness_probe = optional(object({
      transport               = string
      path                    = optional(string)
      port                    = number
      interval_seconds        = optional(number, 5)
      failure_count_threshold = optional(number, 3)
    }))
  }))
}

variable "volumes" {
  type = list(object({
    name         = string
    storage_type = string # AzureFile | EmptyDir | Secret
    storage_name = optional(string)
  }))
  default = []
}

variable "ingress" {
  description = "Ingress configuration. null = no ingress (worker/background app)"
  type = object({
    external_enabled           = optional(bool, true)
    target_port                = number
    transport                  = optional(string, "auto")
    allow_insecure_connections = optional(bool, false)
    traffic_weights = optional(list(object({
      label           = optional(string)
      revision_suffix = optional(string)
      latest_revision = optional(bool, false)
      percentage      = number
    })))
  })
  default = null
}

variable "secrets" {
  description = "Secrets injected into the container app"
  type = list(object({
    name  = string
    value = string
  }))
  default   = []
  sensitive = true
}

variable "registries" {
  description = "Container registry credentials"
  type = list(object({
    server               = string
    username             = optional(string)
    password_secret_name = optional(string)
    identity             = optional(string)
  }))
  default = []
}

variable "http_scale_rules" {
  type = list(object({
    name                = string
    concurrent_requests = number
  }))
  default = []
}

variable "custom_scale_rules" {
  type = list(object({
    name             = string
    custom_rule_type = string
    metadata         = map(string)
  }))
  default = []
}

variable "identity_type" {
  description = "None | SystemAssigned | UserAssigned | SystemAssigned, UserAssigned"
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
