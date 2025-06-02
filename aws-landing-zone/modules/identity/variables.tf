variable "iam_roles" {
  description = "Map of IAM roles to create with trust relationships"
  type = map(object({
    name               = string
    trusted_account    = string
    managed_policy_arns = list(string)
  }))
}
