variable "project_id" {
  description = "The ID of the project in which resources will be provisioned."
  type        = string
}

# variable "iam_users" {
#   description = "A list of IAM users to be created in your CloudSQL instance"
#   type = list(object({
#     id    = string,
#     email = string
#   }))
#   default = []
# }