resource "aws_subnet" "my_pub_subnet_1" {
  vpc_id                    = aws_vpc.my_new_vpc.id
  cidr_block                = var.sub_cidr_block[0]
  availability_zone         = var.az[0]
  map_public_ip_on_launch   = true

  tags                      = {
    Name                    = "${var.prefix}-pub-subnet"
    Created_by              = "${var.prefix}"
  }
}