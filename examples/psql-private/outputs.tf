

output "project_id" {
  value       = var.project_id
  description = "The project to run tests against"
}

output "name" {
  description = "The name for Cloud SQL instance"
  value       = module.postgresql-db.instance_name
}

output "psql_conn" {
  value       = module.postgresql-db.instance_connection_name
  description = "The connection name of the master instance to be used in connection strings"
}


output "public_ip_address" {
  description = "The first public (PRIMARY) IPv4 address assigned for the master instance"
  value       = module.postgresql-db.public_ip_address
}