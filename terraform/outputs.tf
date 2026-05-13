output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name (your site URL)"
  value       = "https://${aws_cloudfront_distribution.react_app.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (needed for cache invalidation)"
  value       = aws_cloudfront_distribution.react_app.id
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.react_app.id
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.react_app.arn
}
