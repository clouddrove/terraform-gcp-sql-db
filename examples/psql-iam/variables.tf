
variable "project_id" {
  description = "The ID of the project in which resources will be provisioned."
  type        = string
}

variable "authorized_networks" {
  default = [{
    name  = "sample-gcp-health-checkers-range"
    value = "130.211.0.0/28"
  }]
  type        = list(map(string))
  description = "List of mapped public networks authorized to access to the instances. Default - short range of GCP health-checkers IPs"
}

variable "db_name" {
  description = "The name of the SQL Database instance"
  default     = "example-postgres-public"
}

variable "cloudsql_pg_sa" {
  type        = string
  description = "IAM service account user created for Cloud SQL."
}

variable "database_flags" {
  type = list(object({
    name  = string
    value = string
  }))
}

variable "user_labels" {
  description = "The key/value labels for the Cloud SQL instances."
  type        = map(string)
  default     = {}
}