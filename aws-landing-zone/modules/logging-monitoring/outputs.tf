output "cloudtrail_arn" {
  value = aws_cloudtrail.org_trail.arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.cloudtrail.id
}

output "config_recorder_status" {
  value = aws_config_configuration_recorder.main.id
}

output "guardduty_detector_id" {
  value = aws_guardduty_detector.main.id
}
