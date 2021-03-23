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

# Instance AWS
resource "aws_instance" "my_pub_instance" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = data.aws_subnet.default_subnet.id
  associate_public_ip_address = true  
  vpc_security_group_ids      = [data.aws_security_group.existing_one.id]
  iam_instance_profile        = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name

  count                       = 1
  
  tags         = {
    Name       = "${var.prefix}-EC2"
    Created_by = "Terraform"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.user_name
    private_key = file(var.ssh_key_path)
    timeout     = "4m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install python-pip python-dev -y",
      "sudo pip install awscli -y",
      "echo 'test' > test.txt",
      "aws s3 cp test.txt s3://${var.bucket_name}/test.txt"
    ]
  } 


}  

