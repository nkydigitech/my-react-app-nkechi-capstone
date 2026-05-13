# /tf-apply

## Purpose
Applies the Terraform plan and provisions infrastructure on AWS.

## What it does
1. Runs `terraform apply -auto-approve`
2. Creates/updates all resources defined in `terraform/`
3. Outputs the CloudFront URL and distribution ID

## Usage
```
/tf-apply
```

## Post-apply
- Note the CloudFront domain name from outputs — this is your site URL
- Note the distribution ID — needed for GitHub Actions secrets
- S3 bucket name — also needed for GitHub Actions secrets
