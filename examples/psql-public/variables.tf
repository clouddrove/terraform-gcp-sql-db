
variable "project_id" {
  description = "The ID of the project in which resources will be provisioned."
  type        = string
}

variable "authorized_networks" {
  default = [{
    name  = "sample-gcp-health-checkers-range"
    value = "130.211.0.0/28"
  }]
  description = "List of mapped public networks authorized to access to the instances. Default - short range of GCP health-checkers IPs"
  type        = list(map(string))
}

variable "db_name" {
  description = "The name of the SQL Database instance"
  default     = "example-postgres-public"
  type        = string
}
