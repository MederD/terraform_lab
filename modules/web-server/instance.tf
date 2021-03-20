resource "aws_instance" "my_pub_instance" {
  ami                         = var.ami_name[var.region]
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true  
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  count                       = 1
  
  tags                        = {
    Created_by                = "${var.prefix}"
    Name                      = "${var.prefix}-my_pub_instance"
  }
} 