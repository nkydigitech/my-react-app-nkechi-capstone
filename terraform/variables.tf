variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name for the React app (must be globally unique)"
  type        = string
  default     = "my-react-app-nkechi-capstone"
}
