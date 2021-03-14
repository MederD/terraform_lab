# Data Sources
data "aws_vpc" "default_vpc" {
  id      = var.vpc_id
  default = true
}

data "aws_subnet" "default_subnet" {
  id = var.subnet_id
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = ["amazon"]

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*-x86_64-ebs"]
 }
}

data "aws_security_group" "existing_one" {
  id = var.security_group_id
}