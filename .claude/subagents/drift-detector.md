# drift-detector

## Model
Claude Haiku

## Tools Allowed
Bash (read + execute)

## Purpose
Detects infrastructure drift — changes made outside of Terraform.

## What it does
1. Runs `cd terraform && terraform plan -detailed-exitcode`
2. Exit code 0 = no drift, exit code 2 = drift detected
3. If drift found, reports which resources changed and what attributes differ

## Why Haiku + Bash
- Needs Bash to execute `terraform plan` — read-only subagents can't run commands
- The logic is simple: run a command, parse output, report differences
- No complex reasoning needed — Haiku is fast and sufficient for this
- Bash access is scoped: only runs terraform commands, no destructive operations
