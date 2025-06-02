# Basic security baseline setup including SCPs and Backup Vault

resource "aws_organizations_policy" "deny_unapproved_regions" {
  name        = "DenyUnapprovedRegions"
  description = "Deny use of AWS regions that are not explicitly approved"
  content     = file("${path.module}/scp-deny-unapproved-regions.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "attach_scp" {
  for_each = var.target_ou_ids

  policy_id = aws_organizations_policy.deny_unapproved_regions.id
  target_id = each.value
}

resource "aws_backup_vault" "main" {
  name        = var.backup_vault_name
  tags = {
    Name = var.backup_vault_name
  }
}
