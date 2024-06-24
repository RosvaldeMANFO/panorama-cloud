provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 
resource "aws_security_group" "backend_sg" {
  name        = "backend_sg"
  description = "Security group for the backend service"
 
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 
resource "aws_security_group" "client_sg" {
  name        = "client_sg"
  description = "Security group for the client service"
 
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 
resource "aws_instance" "http_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.client_sg.id]
 
  tags = {
    Name = "HTTP"
  }
}
 
resource "aws_instance" "api_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.backend_sg.id]
 
  tags = {
    Name = "API"
  }
}
 
resource "aws_instance" "data_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.backend_sg.id]
 
  tags = {
    Name = "DATA"
  }
}
 
output "http_instance_ip" {
  value = aws_instance.http_instance.public_ip
}
 
output "api_instance_ip" {
  value = aws_instance.api_instance.public_ip
}
 
output "data_instance_ip" {
  value = aws_instance.data_instance.public_ip
}