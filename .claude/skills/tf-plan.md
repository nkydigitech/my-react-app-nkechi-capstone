# /tf-plan

## Purpose
Previews infrastructure changes without applying them. Safe, read-only operation.

## What it does
1. Runs `terraform init` (if not already initialized)
2. Runs `terraform plan`
3. Displays resources to be created/modified/destroyed

## Usage
```
/tf-plan
```

## Expected output
- Resources to add (first run: S3 bucket, CloudFront distribution, OAC, bucket policy)
- No changes if infrastructure is already up to date
