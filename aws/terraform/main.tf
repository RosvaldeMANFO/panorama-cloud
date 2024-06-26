provider "aws" {
  region     = var.region
  access_key = local.aws_access_key
  secret_key = local.aws_secret_key
}
 
resource "aws_instance" "http_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.client_sg.id, aws_security_group.swarm_security_group.id]
 
  tags = {
    Name = "HTTP"
  }
}
 
resource "aws_instance" "api_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.backend_sg.id, aws_security_group.swarm_security_group.id]
 
  tags = {
    Name = "API"
  }
}
 
resource "aws_instance" "data_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.backend_sg.id, aws_security_group.swarm_security_group.id]
 
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