# cost-optimizer

## Model
Claude Haiku

## Tools Allowed
Read-only (no Bash, no file writes)

## Purpose
Estimates infrastructure cost and suggests optimizations.

## Checks
- Estimate monthly S3 cost (storage + request pricing)
- Estimate monthly CloudFront cost (data transfer + requests)
- Check if a restricted CloudFront price class would save money
- Suggest S3 Intelligent-Tiering or lifecycle rules if applicable
- Flag any over-provisioned resources

## Why Haiku
Cost estimation is straightforward arithmetic based on AWS pricing tables. No complex reasoning needed — speed and efficiency over depth. Haiku handles lookups and simple calculations well.
