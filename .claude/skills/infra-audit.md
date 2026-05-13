# /infra-audit

## Purpose
Post-deploy verification — checks security, cost, and drift across the infrastructure.

## What it does
Runs three subagent checks:

### 1. Security Audit (security-auditor)
- S3 bucket public access is fully blocked
- CloudFront uses HTTPS redirect
- OAC is properly configured (no legacy OAI)
- Bucket policy restricts access to CloudFront only

### 2. Cost Optimization (cost-optimizer)
- Estimates monthly cost (S3 storage + CloudFront requests)
- Suggests CloudFront price class restrictions if applicable
- Recommends S3 lifecycle rules for old objects

### 3. Drift Detection (drift-detector)
- Runs `terraform plan` to detect state drift
- Flags any out-of-band changes made outside Terraform

## Usage
```
/infra-audit
```

## Expected output
Summary table with PASS/WARN/FAIL for each check category.
