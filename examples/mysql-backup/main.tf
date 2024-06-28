
module "mysql" {
  source  = "../../module/mysql"

  name                 = "example-mysql-public"
  database_version     = "MYSQL_8_0"
  random_instance_name = true
  project_id           = var.project_id
  zone                 = "us-central1-a"
  region               = "us-central1"
  tier             = "db-n1-standard-1"
  deletion_protection  = false

  additional_users = [
    {
      name            = "tftest2"
      password        = "Example!12345"
      host            = "localhost"
      type            = "BUILT_IN"
      random_password = false
    },
    {
      name            = "tftest3"
      password        = "Example!12345"
      host            = "localhost"
      type            = "BUILT_IN"
      random_password = false
    },
  ]

  
  ip_configuration = {
    ipv4_enabled        = true
    private_network     = null
    require_ssl         = true
    allocated_ip_range  = null
    authorized_networks = []
  }
}


resource "google_storage_bucket" "backup" {
  name     = "${module.mysql.instance_name}-backup"
  location = "us-central1"
  # TODO: don't use force_destroy for production this is just required for testing
  force_destroy = true
  project       = var.project_id
}

module "backup" {
  source  = "../../module/backup"

  region                = "us-central1"
  project_id            = var.project_id
  sql_instance          = module.mysql.instance_name
  export_databases      = []
  export_uri            = google_storage_bucket.backup.url
  backup_retention_time = 1
  backup_schedule       = "5 * * * *"
  export_schedule       = "15 * * * *"
  compress_export       = false
}