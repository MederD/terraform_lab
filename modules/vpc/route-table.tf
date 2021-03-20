# Public Route table
resource "aws_route_table" "rt-pub" {
  vpc_id            = aws_vpc.my_new_vpc.id  
  
  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.my_igw.id
  }

    tags            = {
    Name            = "${var.prefix}-pub-rt"
    Created_by      = "${var.prefix}"
  } 
}

# Route table associations
resource "aws_route_table_association" "my_assoc" {
  subnet_id         = aws_subnet.my_pub_subnet_1.id
  route_table_id    = aws_route_table.rt-pub.id
}
