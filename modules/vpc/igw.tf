resource "aws_internet_gateway" "my_igw" {
  vpc_id        = aws_vpc.my_new_vpc.id

  tags          = {
    Name        = "${var.prefix}-igw"
    Created_by  = "${var.prefix}"
  }
}