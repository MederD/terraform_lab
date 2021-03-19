terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.region
}

# Instance launch template
resource "aws_launch_template" "launch" {
  name                                  = "my_launch_template"
  image_id                              = data.aws_ami.amazon-linux-2.id
  instance_initiated_shutdown_behavior  = "terminate"
  instance_type                         = var.instance_type
  key_name                              = lower(var.key_name)
  
  vpc_security_group_ids = [data.aws_security_group.existing_one.id]
  
  lifecycle {
    create_before_destroy = true
  }
}

# Auto scaling group
resource "aws_autoscaling_group" "asg-group" {
  name                = "my_asg_group"  
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = [data.aws_subnet.existing.id]

  launch_template {
    id      = aws_launch_template.launch.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}