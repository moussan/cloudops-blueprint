variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "Map of public subnets (AZ => CIDR)"
  type        = map(string)
}

variable "private_subnets" {
  description = "Map of private subnets (AZ => CIDR)"
  type        = map(string)
}
