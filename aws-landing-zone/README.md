Here's a complete `README.md` for your AWS Landing Zone Terraform module repository:

---

```markdown
# 🌩 AWS Landing Zone Terraform Modules

A modular, production-ready Terraform implementation to bootstrap a secure, scalable AWS multi-account landing zone, following best practices in identity, networking, and security.

---

## 🧱 Project Structure

```

aws-landing-zone/
├── modules/
│   └── organization-setup/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── examples/
│   └── basic-landing-zone/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── README.md

````

---

## 📦 Modules

### `organization-setup`
Creates the AWS Organization, Organizational Units (OUs), Service Control Policies (SCPs), and member accounts.

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| `organizational_units` | Map of OUs to create | `map(any)` | ✅ |
| `accounts` | Map of accounts to create. Includes name, email, OU, and IAM role. | `map(object)` | ✅ |

#### Example `accounts` input:
```hcl
accounts = {
  sec-account = {
    name      = "SecurityAccount"
    email     = "sec@example.com"
    role_name = "OrganizationAccountAccessRole"
    ou        = "Security"
  }
}
````

#### Outputs

| Name                   | Description                |
| ---------------------- | -------------------------- |
| `organization_id`      | ID of the AWS Organization |
| `organizational_units` | Map of created OUs         |
| `accounts`             | Map of created accounts    |

---

## 🚀 Quick Start

```hcl
module "organization_setup" {
  source = "../../modules/organization-setup"

  organizational_units = {
    "Security"      = {}
    "Infrastructure" = {}
    "Applications"   = {}
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
```

---

## 🔒 Prerequisites

* AWS CLI authenticated with admin permissions
* Terraform >= 1.3
* An AWS billing account email and access to create sub-accounts

---

## 📚 Future Modules

* `identity`: IAM roles, boundaries, and cross-account trust
* `networking`: VPCs, TGW, Route53, and shared subnets
* `logging-monitoring`: CloudTrail, Config, GuardDuty, SecurityHub
* `security-baseline`: SCPs, backup, and guardrails

---

## 📜 License

MIT © Moussa El Najmi
