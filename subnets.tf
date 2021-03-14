resource "aws_subnet" "my_pub_subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.sub_cidr_block[0]
  availability_zone       = var.az[0]
  map_public_ip_on_launch = true

  tags = {
    Name       = "my_pub_subnet-1"
    Env        = "Dev"
    Created_by = "${var.prefix} Terraform"
  }
}

#------------------------------------PRIVATE SUBNET-------------------------
resource "aws_subnet" "my_private_subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.sub_cidr_block[1]
  availability_zone       = var.az[1]
  map_public_ip_on_launch = false

  tags = {
    Name       = "my_private_subnet-1"
    Env        = "Dev"
    Created_by = "${var.prefix} Terraform"
  }
}