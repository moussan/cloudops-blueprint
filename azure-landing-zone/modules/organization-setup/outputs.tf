output "organization_id" {
  value = aws_organizations_organization.this.id
}

output "organizational_units" {
  value = aws_organizations_organizational_unit.ou
}

output "accounts" {
  value = aws_organizations_account.account
}
