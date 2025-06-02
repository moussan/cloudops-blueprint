resource "aws_organizations_organization" "this" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "ou" {
  for_each = var.organizational_units
  name     = each.key
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_account" "account" {
  for_each      = var.accounts
  name          = each.value.name
  email         = each.value.email
  role_name     = each.value.role_name
  parent_id     = aws_organizations_organizational_unit.ou[each.value.ou].id
  close_on_deletion = true
}
