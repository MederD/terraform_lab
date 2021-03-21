# Subnet group for DB instance
resource "aws_db_subnet_group" "db_subnet" {
  name       = "my_db_subnet_group"
  subnet_ids = [aws_subnet.my_private_subnet-1.id, aws_subnet.my_private_subnet-2.id]
}

# Private DB instance
resource "aws_db_instance" "my_db_instance" {
  allocated_storage         = var.db_storage
  db_subnet_group_name      = aws_db_subnet_group.db_subnet.id
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

  vpc_security_group_ids    = ["${aws_security_group.secgroup-pr.id}"]
  
  tags          = {
    Name        = "${var.prefix}-db-instance"
    Created_by  = "${var.prefix}"
  }
}