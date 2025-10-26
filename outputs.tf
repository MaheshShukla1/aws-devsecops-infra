# EC2
output "ec2_public_ip" {
  value = module.ec2.app_server_public_ip
}

output "ec2_instance_id" {
  value = module.ec2.app_server_id
}

# S3
output "s3_bucket_name" {
  value = module.s3.storage_bucket_name
}

# VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "security_group_id" {
  value = module.vpc.web_sg_id
}