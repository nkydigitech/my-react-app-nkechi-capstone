# /deploy

## Purpose
Manually builds and deploys the React app to S3 + invalidates CloudFront cache.

## What it does
1. Runs `npm ci` (clean install)
2. Runs `npm run build` (produces `build/` directory)
3. Syncs `build/` to S3: `aws s3 sync build/ s3://BUCKET_NAME --delete`
4. Invalidates CloudFront: `aws cloudfront create-invalidation --distribution-id DIST_ID --paths "/*"`

## Usage
```
/deploy
```

## Important
- Syncs `build/` — NOT the project root
- `--delete` removes old files from S3 that are no longer in `build/`
- Cache invalidation ensures visitors see the latest version immediately
