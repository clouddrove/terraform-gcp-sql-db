
module "postgresql-db" {
  source = "../../module/postgre"

  name                 = var.db_name
  random_instance_name = false
  database_version     = "POSTGRES_15"
  project_id           = var.project_id
  zone                 = "us-central1-c"
  region               = "us-central1"
  tier                 = "db-g1-small"
  availability_type    = "ZONAL"
  disk_size            = 10
  disk_type            = "PD_SSD"

  deletion_protection = false

  ip_configuration = {
    ipv4_enabled                                  = false
    enable_private_path_for_google_cloud_services = true
    private_network                               = "projects/project-id/global/networks/module-test" # Ensure private connection in vpc are enabled.
    require_ssl                                   = false
    ssl_mode                                      = "ENCRYPTED_ONLY"
    allocated_ip_range                            = ""
  }

  password_validation_policy_config = {
    complexity                  = "COMPLEXITY_DEFAULT"
    disallow_username_substring = true
    min_length                  = 5
    password_change_interval    = null
    reuse_interval              = null
  }

  database_flags = [
    for flag in var.database_flags : {
      name  = flag.name
      value = flag.value
    }
  ]

  additional_users = [
    {
      name            = "tftest1"
      password        = "Ex@mp!e1"
      host            = "localhost"
      random_password = false
    }
  ]

}
