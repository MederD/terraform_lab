resource "aws_security_group" "app-prod" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "application-sg"
  description = "application-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.load_balancer_security_group.id]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.load_balancer_security_group.id]
  }

  tags = {
    Name = "${local.common_prefix}-instance-sg"
  }
}

resource "aws_security_group" "load_balancer_security_group" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "alb-sg"
  description = "alb-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.common_prefix}-alb-sg"
  }
}

resource "aws_security_group" "allow-mariadb" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "rds-sg"
  description = "rds-sg"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app-prod.id] # allowing access from our example instance
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  tags = {
    Name = "${local.common_prefix}-rds-sg"
  }
}
