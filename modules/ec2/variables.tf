# Instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

# Subnet ID to launch EC2 in
variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

# Security group IDs
variable "security_group_id" {
  description = "Security group ID for EC2"
  type        = string
}

# EC2 key pair
variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

# S3 bucket name for IAM policy scoping
variable "s3_bucket_name" {
  description = "Name of the S3 bucket for read access"
  type        = string
}