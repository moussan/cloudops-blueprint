variable "trail_name" {
  description = "Name of the CloudTrail trail"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for logs"
  type        = string
}

variable "config_role_arn" {
  description = "IAM Role ARN for AWS Config to assume"
  type        = string
}
