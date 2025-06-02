output "scp_policy_id" {
  value = aws_organizations_policy.deny_unapproved_regions.id
}

output "backup_vault_arn" {
  value = aws_backup_vault.main.arn
}
