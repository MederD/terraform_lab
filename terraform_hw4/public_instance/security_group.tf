# --------------------Public SG
resource "aws_security_group" "my_pub_sg" {
  name          = "allow_80_443_22_3306"
  description   = "Allow_80_443_22_3306"
  vpc_id        = var.vpc_id # This will refer to non-default VPC module

  ingress {
    description = "HTTP port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "mysql connection"
    from_port   = var.db_port # This will refer to RDS module
    to_port     = var.db_port # This will refer to RDS module
    protocol    = "tcp"
    cidr_blocks = element([var.sub_cidr_private], 0) # This will refer to non-default VPC module
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
    Name        = "${var.prefix}-allow-pub"
    Created_by  = var.prefix
  }
}