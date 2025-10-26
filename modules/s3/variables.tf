# Prefix for S3 bucket name
variable "bucket_name_prefix" {
  description = "Prefix for S3 bucket name"
  type        = string
  default     = "devsecops-storage"
}

# Environment tag for bucket
variable "environment" {
  description = "Environment tag for S3 bucket"
  type        = string
  default     = "DevSecOps"
}
