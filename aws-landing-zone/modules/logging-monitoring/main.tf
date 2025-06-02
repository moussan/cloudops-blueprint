# Centralized CloudTrail, Config, and GuardDuty setup

resource "aws_cloudtrail" "org_trail" {
  name                          = var.trail_name
  s3_bucket_name                = var.s3_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  is_organization_trail         = true
  depends_on                    = [aws_s3_bucket.cloudtrail]

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::"]
    }
  }
}

resource "aws_s3_bucket" "cloudtrail" {
  bucket = var.s3_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "cloudtrail-logs"
  }
}

resource "aws_config_configuration_recorder" "main" {
  name     = "default"
  role_arn = var.config_role_arn

  recording_group {
    all_supported = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "main" {
  name           = "default"
  s3_bucket_name = var.s3_bucket_name
  depends_on     = [aws_config_configuration_recorder.main]
}

resource "aws_guardduty_detector" "main" {
  enable = true
}
