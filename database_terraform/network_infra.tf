# Non-default VPC
resource "aws_vpc" "my_new_vpc" {
  cidr_block     = var.cidr_block_vpc

  tags           = {
    Name         = "${var.prefix}-vpc"
    Created_by   = "${var.prefix}"
  }
}

# Non-default IGW
resource "aws_internet_gateway" "my_igw" {
  vpc_id        = aws_vpc.my_new_vpc.id

  tags          = {
    Name        = "${var.prefix}-igw"
    Created_by  = "${var.prefix}"
  }
}

# Route table public
resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.my_new_vpc.id  
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

    tags          = {
    Name        = "${var.prefix}-rt-pub"
    Created_by  = "${var.prefix}"
  }
}

# Route table private
resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.my_new_vpc.id  
  
    tags          = {
    Name        = "${var.prefix}-rt-private"
    Created_by  = "${var.prefix}"
  }
}

# Route table associations
resource "aws_route_table_association" "my_assoc" {
  subnet_id      = aws_subnet.my_pub_subnet-1.id
  route_table_id = aws_route_table.rt-pub.id
}

resource "aws_route_table_association" "route_assoc_private" {
  subnet_id      = aws_subnet.my_private_subnet-1.id
  route_table_id = aws_route_table.rt-private.id
}

# Public Subnet
resource "aws_subnet" "my_pub_subnet-1" {
  vpc_id                  = aws_vpc.my_new_vpc.id
  cidr_block              = var.sub_cidr_block[0]
  availability_zone       = var.az[0]
  map_public_ip_on_launch = true

  tags          = {
    Name        = "${var.prefix}-pub-subnet-1"
    Created_by  = "${var.prefix}"
  }
}

# Private Subnets
resource "aws_subnet" "my_private_subnet-1" {
  vpc_id                  = aws_vpc.my_new_vpc.id
  cidr_block              = var.sub_cidr_block[1]
  availability_zone       = var.az[1]
  map_public_ip_on_launch = false

  tags          = {
    Name        = "${var.prefix}-pr-subnet-1"
    Created_by  = "${var.prefix}"
  }
}

resource "aws_subnet" "my_private_subnet-2" {
  vpc_id                  = aws_vpc.my_new_vpc.id
  cidr_block              = var.sub_cidr_block[2]
  availability_zone       = var.az[2]
  map_public_ip_on_launch = false

  tags          = {
    Name        = "${var.prefix}-pr-subnet-2"
    Created_by  = "${var.prefix}"
  }
}