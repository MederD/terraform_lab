# CREATE NEW VPC RESOURCE
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    "Name" = "${local.common_prefix}-vpc"
  }
}

# CREATE NEW PUBLIC SUBNETS
resource "aws_subnet" "public_subnet" {
  count                   = var.public_subnet_count
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = var.azone[count.index]
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${local.common_prefix}-public_subnet-${count.index + 1}"
  }
}

# CREATE NEW PRIVATE SUBNETS
resource "aws_subnet" "private_subnet" {
  count                   = length(var.azone)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.my_vpc.cidr_block, 8, count.index)
  availability_zone       = var.azone[count.index]
  map_public_ip_on_launch = false

  tags = {
    "Name" = "${local.common_prefix}-private_subnet-${count.index + 1}"
  }
}

# CREATE INTERNET GATEWAY
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    "Name" = "${local.common_prefix}-igw"
  }
}

# CREATE ROUTE TABLE PUBLIC
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    "Name" = "${local.common_prefix}-public-rt"
  }
}

# CREATE PUBLIC SUBNET ASSOC
resource "aws_route_table_association" "route_assoc_public" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public.id

  depends_on = [aws_internet_gateway.my_igw]
}

# CREATE EIP
resource "aws_eip" "nat_gw_eip" {
  vpc = true

  depends_on = [aws_internet_gateway.my_igw]
}

# CREATE NAT GW
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  depends_on = [aws_internet_gateway.my_igw]
}

# CREATE ROUTE TABLE PRIVATE
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "${local.common_prefix}-private-rt"
  }
}

# CREATE PRIVATE SUBNET ASSOC
resource "aws_route_table_association" "route_assoc_private" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private.id
}