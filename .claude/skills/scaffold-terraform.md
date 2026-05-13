# /scaffold-terraform

## Purpose
Generates the Terraform configuration files for deploying a React SPA to AWS.

## What it creates
- `terraform/main.tf` — S3 bucket (private, no public access), CloudFront distribution with OAC, bucket policy
- `terraform/variables.tf` — configurable region and bucket name
- `terraform/outputs.tf` — CloudFront URL, distribution ID, bucket name/ARN

## Infrastructure
- **S3 Bucket**: Static file hosting with all public access blocked
- **CloudFront**: CDN with OAC, HTTPS redirect, SPA error handling (403/404 → index.html)
- **Bucket Policy**: Only allows CloudFront service principal via OAC

## Usage
```
/scaffold-terraform
```

Creates the `terraform/` directory with all config files ready for `terraform init`.
