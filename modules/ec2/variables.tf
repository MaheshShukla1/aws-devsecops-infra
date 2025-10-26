# AMI for EC2
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2
}

# Instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
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
