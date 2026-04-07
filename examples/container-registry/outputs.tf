output "registry_id" {
  value = module.container_registry.id
}

output "registry_name" {
  value = module.container_registry.name
}

output "login_server" {
  value = module.container_registry.login_server
}
