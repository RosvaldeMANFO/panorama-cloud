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

locals {
  dot_env_regex = "(?m:^\\s*([^#\\s]\\S*)\\s*=\\s*[\"']?(.*[^\"'\\s])[\"']?\\s*$)"
  dot_env       = {for tuple in regexall(local.dot_env_regex, file(".env")) : tuple[0] => sensitive(tuple[1])}
  aws_access_key = local.dot_env["ACCESS_KEY"]
  aws_secret_key = local.dot_env["SECRET_KEY"]
}