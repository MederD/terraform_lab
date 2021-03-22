# Subnet group for DB instance
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "my_db_subnet_group"
  subnet_ids = var.my_private_subnets_ids
}

# Private DB instance
resource "aws_db_instance" "my_db_instance" {
  identifier                = var.db_identifier
  allocated_storage         = var.db_storage
  db_subnet_group_name      = aws_db_subnet_group.db_subnet_group.id
  engine                    = var.db_engine
  engine_version            = var.db_engine_ver
  instance_class            = var.db_instance_class
  multi_az                  = var.db_multi_az
  name                      = var.db_name
  username                  = var.db_username
  password                  = var.db_password
  port                      = var.db_port
  publicly_accessible       = var.db_publicly_accessible
  storage_encrypted         = var.db_storage_encrypted
  skip_final_snapshot       = true

  vpc_security_group_ids    = [aws_security_group.secgroup-pr.id]
  
  tags          = {
    Name        = "${var.prefix}-db-rds"
    Created_by  = var.prefix
  }
}