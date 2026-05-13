output "s3_bucket_name" {
  value = aws_s3_bucket.react_app.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.react_app.arn
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.react_app.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.react_app.domain_name
}

output "cloudfront_distribution_arn" {
  value = aws_cloudfront_distribution.react_app.arn
}