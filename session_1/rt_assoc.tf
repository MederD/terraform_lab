resource "aws_route_table_association" "my_assoc" {
  subnet_id      = aws_subnet.my_pub_subnet-1.id
  route_table_id = aws_route_table.rt-pub.id
}

resource "aws_route_table_association" "route_assoc_private" {
  subnet_id      = aws_subnet.my_private_subnet-1.id
  route_table_id = aws_route_table.rt-private.id
}