terraform {
  required_providers {
    aws         = {
      source    = "hashicorp/aws"
      version   = "~> 3.0"
    }
  }
}

provider "aws" {
  region        = var.region
}

# Module for non-default vpc
module "myapp_vpc" {
    source          = "./vpc"
    sub_cidr_block  = var.sub_cidr_block
    az              = var.az
	cidr_block_vpc  = var.cidr_block_vpc
    prefix          = var.prefix
}

# Module for web-server
module "myapp_web_server" {
    source          = "./web-server"
    my_ip           = var.my_ip
    key_name        = var.key_name
    user_name       = var.user_name
    ami_name        = var.ami_name
    region          = var.region
    instance_type   = var.instance_type
    prefix          = var.prefix
    subnet_id       = module.myapp_vpc.my_subnet.id
    vpc_id          = module.myapp_vpc.my_vpc.id
}