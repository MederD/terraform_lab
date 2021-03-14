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

# Instance AWS
resource "aws_instance" "my_pub_instance" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = data.aws_subnet.default_subnet.id
  associate_public_ip_address = true  
  vpc_security_group_ids      = [data.aws_security_group.existing_one.id]
  count                       = 1
  
  tags = {
    Created_by = "${var.prefix} Terraform"
    Name       = "My EC2"
  }
}  

# Output
output "instance_public_ip" {
  value       = aws_instance.my_pub_instance.*.public_ip
  description = "The public IP address of the public server instance."
}