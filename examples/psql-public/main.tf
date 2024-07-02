
module "postgresql-db" {
  source = "../../module/postgre"

  name                 = var.db_name
  random_instance_name = false
  database_version     = "POSTGRES_15"
  project_id           = var.project_id
  zone                 = "us-central1-c"
  region               = "us-central1"
  edition              = "ENTERPRISE_PLUS"
  tier                 = "db-perf-optimized-N-2"
  data_cache_enabled   = true

  deletion_protection = false

  ip_configuration = {
    ipv4_enabled        = true
    private_network     = null
    require_ssl         = true
    allocated_ip_range  = null
    authorized_networks = var.authorized_networks
  }
}