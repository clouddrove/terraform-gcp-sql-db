
output "backup_workflow_name" {
  value       = module.backup.backup_workflow_name
  description = "The name for internal backup workflow"
}

output "export_workflow_name" {
  value       = module.backup.export_workflow_name
  description = "The name for export workflow"
}

output "project_id" {
  value       = var.project_id
  description = "The project ID used"
}

output "service_account" {
  value       = module.backup.service_account
  description = "The service account email running the scheduler and workflow"
}

output "instance_name" {
  value       = module.mysql.instance_name
  description = "The name of the SQL instance"
}
