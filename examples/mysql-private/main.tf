module "safer-mysql-db" {
  source  = "../../module/pvt-mysql"

  name                 = var.db_name
  random_instance_name = true
  project_id           = var.project_id

  deletion_protection = false
  

  database_version = "MYSQL_8_0"
  region           = "us-central1"
  zone             = "us-central1-c"
  tier             = "db-n1-standard-1"


  database_flags = [
    {
      name  = "cloudsql_iam_authentication"
      value = "on"
    },
  ]

  additional_users = [
    {
      name            = "app"
      password        = "PaSsWoRd"
      host            = "localhost"
      type            = "BUILT_IN"
      random_password = false
    },

  ]

  # Supports creation of both IAM Users and IAM Service Accounts with provided emails
  iam_users = [
    {
      id    = "cloudsql_mysql_sa",
      email = var.cloudsql_mysql_sa
    }
  ]

  vpc_network        = "projects/virtual-voyage-423511-d7/global/networks/module-test"   # Ensure private connection in vpc are enabled
  require_ssl = false
  ssl_mode = "ENCRYPTED_ONLY"

}