# Cloud SQL Database Backup Example

This example demonstrates how to create:

- A MySQL CloudSQL Instance
- A GCS Bucket for storing the Backup
- Workflows for exports (external backups) and (internal) backups
- Scheduler service created to trigger backup cron

## Run Terraform

Create resources with Terraform:

```bash
terraform init
terraform plan
terraform apply


Here's a `README.md` for the Cloud SQL Database Backup example:

```markdown
# Cloud SQL Database Backup Example

This example demonstrates how to create:

- A MySQL CloudSQL Instance
- A GCS Bucket for storing the Backup
- Workflows for exports (external backups) and (internal) backups

## Run Terraform

Create resources with Terraform:

```bash
terraform init
terraform plan
terraform apply
```

To remove all resources created by Terraform:

```bash
terraform destroy
```

## Inputs

| Name        | Description                                                   | Type   | Default | Required |
| ----------- | ------------------------------------------------------------- | ------ | ------- | -------- |
| project_id  | The ID of the project in which resources will be provisioned. | string | n/a     | yes      |

## Outputs

| Name                   | Description                                |
| ---------------------- | ------------------------------------------ |
| backup_workflow_name   | The name for internal backup workflow      |
| export_workflow_name   | The name for export workflow               |
| instance_name          | The name of the SQL instance               |
| mysql-password         | n/a                                        |
| project_id             | The project ID used                        |
|