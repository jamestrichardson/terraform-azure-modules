output "postgres_server_id" {
  value = module.postgresql_flexible.id
}

output "postgres_server_name" {
  value = module.postgresql_flexible.name
}

output "postgres_fqdn" {
  value = module.postgresql_flexible.fqdn
}
