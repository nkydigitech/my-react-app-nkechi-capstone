# security-auditor

## Model
Claude Sonnet

## Tools Allowed
Read-only (no Bash, no file writes)

## Purpose
Audits the deployed infrastructure for security misconfigurations.

## Checks
- S3 bucket public access block is enabled (all 4 settings = true)
- No bucket ACLs granting public access
- CloudFront uses OAC (not legacy OAI)
- Viewer protocol policy is "redirect-to-https"
- Bucket policy only allows CloudFront service principal
- No wildcard (*) principals in any policy

## Why Sonnet
Security analysis requires deeper reasoning to evaluate policy documents, identify subtle misconfigurations, and understand the implications of IAM/resource policies. Haiku would miss edge cases.
