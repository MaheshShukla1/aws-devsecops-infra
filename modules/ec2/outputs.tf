# Public IP of EC2 instance
output "app_server_public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "Public IP of the EC2 instance"
}

# EC2 Instance ID
output "app_server_id" {
  value       = aws_instance.app_server.id
  description = "ID of the EC2 instance"
}