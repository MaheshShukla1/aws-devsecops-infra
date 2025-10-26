# VPC ID
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the created VPC"
}

# Public Subnet ID
output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "ID of the public subnet"
}

# Security Group ID
output "web_sg_id" {
  value       = aws_security_group.web_sg.id
  description = "ID of the security group allowing SSH + HTTP"
}
