provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  az                 = var.az
  my_ip              = var.my_ip
  vpc_name           = var.vpc_name
}

# S3 Module (called before EC2 since EC2 depends on bucket name)
module "s3" {
  source             = "./modules/s3"
  bucket_name_prefix = var.bucket_name_prefix
  environment        = var.environment
}

# EC2 Module
module "ec2" {
  source            = "./modules/ec2"
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.web_sg_id
  key_name          = var.key_name
  s3_bucket_name    = module.s3.storage_bucket_name
}