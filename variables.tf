variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "az" {
  default = "ap-south-1a"
}

variable "my_ip" {
  description = "Your public IP for SSH (e.g., x.x.x.x/32)"
  type        = string
}

variable "vpc_name" {
  default = "devsecops-vpc"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key pair name"
  type        = string
}

variable "bucket_name_prefix" {
  default = "devsecops-storage"
}

variable "environment" {
  default = "DevSecOps"
}