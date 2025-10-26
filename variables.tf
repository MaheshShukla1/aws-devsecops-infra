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
  description = "Your public IP for SSH"
}

variable "vpc_name" {
  default = "devsecops-vpc"
}

variable "ami" {
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key pair name"
}

variable "bucket_name_prefix" {
  default = "devsecops-storage"
}

variable "environment" {
  default = "DevSecOps"
}
