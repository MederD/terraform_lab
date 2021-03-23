# Provider
terraform {
  required_providers {
    aws       = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.region
}

# ALB Target Group Attachment
resource "aws_lb_target_group_attachment" "test" {
  count            = length(module.public_instance.instance_id)
  target_group_arn = element(module.alb.target_group_arns, 0)
  target_id        = element(module.public_instance.instance_id, count.index)
  port             = 80
}

# ALB module
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = var.subnets
  security_groups    = var.security_groups

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = var.certificate_arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Name = "${var.prefix}-ALB"
  }
}

# Module EC2 instance
module "public_instance" {
  source  = "github.com/MederD/module_aws_public_instance"

my_ip                   = var.my_ip
key_name                = var.key_name
user_name               = var.user_name
ami_name                = var.ami_name
region                  = var.region
prefix                  = var.prefix
instance_type           = var.instance_type
subnet_id               = data.aws_subnet.default_subnet.id
vpc_id                  = data.aws_vpc.default_vpc.id
db_port                 = var.db_port
sub_cidr_private        = var.sub_cidr_private
ssh_key_path            = var.ssh_key_path 
ssh_key_path_pub        = var.ssh_key_path_pub      
instance_count          = var.instance_count   
}
