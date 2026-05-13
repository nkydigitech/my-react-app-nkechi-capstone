output "cloudfront_domain_name" {
  value = "https://d1h475cmilnnpu.cloudfront.net"
}

output "cloudfront_distribution_id" {
  value = "EDPODDH96UG7Y"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.react_app.id
}