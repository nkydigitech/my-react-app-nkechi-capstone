terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}

# -----------------------------
# S3 BUCKET (Terraform-managed)
# -----------------------------
resource "aws_s3_bucket" "react_app" {
  bucket = var.bucket_name

  tags = {
    Name        = "my-react-app"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

# -----------------------------
# PUBLIC ACCESS BLOCK
# -----------------------------
resource "aws_s3_bucket_public_access_block" "react_app" {
  bucket = aws_s3_bucket.react_app.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# -----------------------------
# OAC (IMPORT ONLY - already exists in AWS)
# -----------------------------
resource "aws_cloudfront_origin_access_control" "react_app" {
  name                              = "react-app-oac"
  description                       = "OAC for React App S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"

  lifecycle {
    prevent_destroy = true
  }
}

# -----------------------------
# S3 BUCKET POLICY (LOCKED TO YOUR EXISTING CLOUDFRONT DISTRIBUTION)
# -----------------------------
resource "aws_s3_bucket_policy" "react_app" {
  bucket = aws_s3_bucket.react_app.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontOnly"
        Effect = "Allow"

        Principal = {
          Service = "cloudfront.amazonaws.com"
        }

        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.react_app.arn}/*"

        Condition = {
          StringEquals = {
            # 🔥 IMPORTANT: your REAL CloudFront ID
            "AWS:SourceArn" = "arn:aws:cloudfront::483519904572:distribution/EDPODDH96UG7Y"
          }
        }
      }
    ]
  })
}