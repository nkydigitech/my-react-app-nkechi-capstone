# My React App — AWS Deployment

## Architecture
- **App**: React SPA (Create React App)
- **Build**: `npm run build` → outputs to `build/`
- **Hosting**: AWS S3 (static file storage) + CloudFront (global CDN)
- **Infrastructure**: Managed with Terraform (IaC)
- **CI/CD**: GitHub Actions — auto-deploys on push to `main`

## Deployment Workflow
1. `/scaffold-terraform` → generates S3 bucket + CloudFront distribution Terraform config
2. `/tf-plan` → previews infrastructure changes (non-destructive)
3. `/tf-apply` → provisions the infrastructure on AWS
4. `/setup-gh-actions create` → generates the GitHub Actions CI/CD workflow
5. `git push origin main` → triggers build + S3 sync + CloudFront invalidation
6. `/infra-audit` → post-deploy security, cost, and drift verification

## Key Paths
- Source code: `src/`
- Build output: `build/`
- Terraform configs: `terraform/`
- CI/CD workflow: `.github/workflows/deploy.yml`
- Claude skills: `.claude/skills/`
- Subagents: `.claude/subagents/`

## Important Notes
- Always sync `build/` to S3 — never the project root
- CloudFront uses OAC (Origin Access Control) — S3 bucket is NOT public
- SPA routing: custom error responses return `index.html` for 403/404
- All infrastructure changes go through Terraform — no ClickOps
