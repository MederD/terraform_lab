resource "aws_security_group" "my_sg" {
  name              = "mu pub security group"
  description       = "Allow port 80 and 22"
  vpc_id            = var.vpc_id

  ingress {
    description     = "HTTP port"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    description     = "SSH port"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = var.my_ip
  }    

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags              = {
    Created_by      = "${var.prefix}"
    Name            = "${var.prefix}-sg_80_22"
  }
}