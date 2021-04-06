# resource "aws_db_subnet_group" "mariadb-subnet" {
#   name        = "mariadb-subnet"
#   description = "RDS subnet group"
#   subnet_ids  = toset(aws_subnet.private_subnet.*.id)
# }

# resource "aws_db_parameter_group" "mariadb-parameters" {
#   name        = "mariadb-params"
#   family      = "mariadb10.2"
#   description = "MariaDB parameter group"

#   parameter {
#     name  = "max_allowed_packet"
#     value = "16777216"
#   }
# }

# resource "aws_db_instance" "mariadb" {
#   allocated_storage       = 20
#   engine                  = "mariadb"
#   engine_version          = "10.2.15"
#   instance_class          = "db.t2.micro"
#   identifier              = "mariadb"
#   name                    = "mydatabase"
#   username                = "root"
#   password                = var.RDS_PASSWORD
#   db_subnet_group_name    = aws_db_subnet_group.mariadb-subnet.name
#   parameter_group_name    = aws_db_parameter_group.mariadb-parameters.name
#   multi_az                = "false"
#   vpc_security_group_ids  = [aws_security_group.allow-mariadb.id]
#   storage_type            = "gp2"
#   backup_retention_period = 0
#   availability_zone       = element(aws_subnet.public_subnet.*.availability_zone, 0)
#   skip_final_snapshot     = true

#   tags = {
#     Name = "${local.common_prefix}-rds"
#   }
# }