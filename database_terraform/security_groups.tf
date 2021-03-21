# locals {
#   rds_cidr_blocks = "[0.0.0.0/16]"
# }

# Public SG
resource "aws_security_group" "my_pub_sg" {
  name        = "my-public-sg"
  description = "Allow port 80 and 22"
  vpc_id      = aws_vpc.my_new_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "mysql connection"
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = [var.sub_cidr_block[1], var.sub_cidr_block[2]]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.my_ip
  }    

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = {
    Name        = "${var.prefix}-allow-22-80"
    Created_by  = "${var.prefix}"
  }
}

#-----------------------------------------SG for Private Instance----------------------
resource "aws_security_group" "secgroup-pr" {
  name        = "my-secgroup-pr"
  description = "Private Security Group"
  vpc_id      = aws_vpc.my_new_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.sub_cidr_block[0]]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.sub_cidr_block[0]]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = {
    Name        = "${var.prefix}-private-SG"
    Created_by  = "${var.prefix}"
  }
}
