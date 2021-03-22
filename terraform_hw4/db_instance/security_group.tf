#-----------------------------------------SG for Private Instance----------------------
resource "aws_security_group" "secgroup-pr" {
  name          = "my-private-sg"
  description   = "Private Security Group"
  vpc_id        = var.vpc_id # This will refer to non-default VPC module

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = element([var.sub_cidr_public], 0) # This will refer to non-default VPC module
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = element([var.sub_cidr_public], 0) # This will refer to non-default VPC module
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = {
    Name        = "${var.prefix}-private-SG"
    Created_by  = var.prefix
  }
}

