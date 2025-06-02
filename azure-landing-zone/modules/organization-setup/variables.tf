variable "organizational_units" {
  description = "Map of OUs to create"
  type        = map(any)
}

variable "accounts" {
  description = "Map of account configs"
  type = map(object({
    name      = string
    email     = string
    role_name = string
    ou        = string
  }))
}
