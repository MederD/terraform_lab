# Data Source - VPC
data "aws_vpc" "default_vpc" {
  id      = var.vpc_id
  default = true
}

# Data Source - Subnet
data "aws_subnet" "default_subnet" {
  id = var.subnet_id
}



