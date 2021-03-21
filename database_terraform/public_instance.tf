terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.region
}

# Public instance
resource "aws_instance" "my_pub_instance" {
  ami                         = var.ami_name[var.region]
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.my_pub_subnet-1.id
  associate_public_ip_address = true  
  vpc_security_group_ids      = [aws_security_group.my_pub_sg.id]
  count                       = 1
  
  tags          = {
    Name        = "${var.prefix}-pub-instance"
    Created_by  = "${var.prefix}"
    Date        = timestamp()
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
      "sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm",
      "sudo rpm -ivh mysql57-community-release-el7-9.noarch.rpm",
      "sudo yum install mysql-server -y",
      "sudo systemctl start mysqld"
    ]
  }
}  

# mysql -h terraform-20210321190723208300000001.cvebfuveorus.us-east-1.rds.amazonaws.com -P 3306 -u admin -p


