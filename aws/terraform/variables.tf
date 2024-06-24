variable "region" {
  default = "us-east-1"
}
 
variable "instance_type" {
  default = "t2.micro"
}
 
variable "key_name" {
  default = "myKey"
}
 
variable "ami" {
  default = "ami-0e001c9271cf7f3b9"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}
 
variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}