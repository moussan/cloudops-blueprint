# IAM roles and cross-account trust setup

resource "aws_iam_role" "account_access" {
  for_each = var.iam_roles

  name = each.value.name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = each.value.trusted_account
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = each.value.managed_policy_arns
}
