# Route tables
resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.my_vpc.id  
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

    tags = {
    Name = "rt-public"
    Created_by = "${var.prefix} Terraform"
  } 
}

resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.my_vpc.id  
  
    tags = {
    Name = "private_rt"
    Created_by = "${var.prefix} Terraform"
  } 
}