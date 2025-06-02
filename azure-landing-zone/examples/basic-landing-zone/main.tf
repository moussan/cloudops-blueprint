module "organization_setup" {
  source = "../../modules/organization-setup"

  organizational_units = {
    "Security" = {}
    "Infrastructure" = {}
    "Applications" = {}
  }

  accounts = {
    sec-account = {
      name      = "SecurityAccount"
      email     = "sec@example.com"
      role_name = "OrganizationAccountAccessRole"
      ou        = "Security"
    }
    infra-account = {
      name      = "InfraAccount"
      email     = "infra@example.com"
      role_name = "OrganizationAccountAccessRole"
      ou        = "Infrastructure"
    }
  }
}
