project_id = "virtual-voyage-423511-d7"
db_name = "testing-module"
cloudsql_pg_sa = "tanveer.shaikh@clouddrove.com"
database_flags = [
  {
    name  = "cloudsql.enable_pgaudit"
    value = "on"
  },
  {
    name  = "cloudsql.iam_authentication"
    value = "on"
  },
  {
    name  = "idle_in_transaction_session_timeout"
    value = "2147483647"
  },
  {
    name  = "log_connections"
    value = "on"
  },
  {
    name  = "log_disconnections"
    value = "on"
  },
  {
    name  = "log_min_duration_statement"
    value = -1
  },
  {
    name  = "log_min_error_statement"
    value = "error"
  },
  {
    name  = "log_min_messages"
    value = "error"
  },
  {
    name  = "log_statement"
    value = "ddl"
  },
  {
    name  = "log_error_verbosity"
    value = "default"
  },
]