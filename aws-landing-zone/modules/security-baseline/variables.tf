variable "target_ou_ids" {
  description = "Map of OU IDs to attach SCP to"
  type        = map(string)
}

variable "backup_vault_name" {
  description = "Name of the AWS Backup vault"
  type        = string
}
