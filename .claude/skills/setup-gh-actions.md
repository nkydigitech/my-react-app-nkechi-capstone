# /setup-gh-actions

## Purpose
Generates the GitHub Actions CI/CD workflow for automated deployment.

## What it does
Creates `.github/workflows/deploy.yml` that:
1. Triggers on push to `main`
2. Checks out code
3. Sets up Node.js 18
4. Runs `npm ci` (install dependencies)
5. Runs `npm run build` (compile React → `build/`)
6. Configures AWS credentials from secrets
7. Syncs `build/` to S3 (with `--delete`)
8. Invalidates CloudFront cache

## Usage
```
/setup-gh-actions create
```

## Required GitHub Secrets
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `S3_BUCKET`
- `CLOUDFRONT_DISTRIBUTION_ID`

## Key difference from static site deployment
Static sites sync the project root directly. React apps MUST run `npm ci && npm run build` first, then sync only the `build/` directory.
