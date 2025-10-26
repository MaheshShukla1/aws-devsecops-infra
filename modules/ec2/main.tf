data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "app_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "Hello from DevSecOps EC2 - Ubuntu" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "DevSecOps-AppServer"
    Environment = "DevSecOps"
  }

  depends_on = [aws_iam_instance_profile.ec2_profile]
}