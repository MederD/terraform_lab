# Create a non-default VPC
resource "aws_vpc" "my_new_vpc" {
  cidr_block     = var.cidr_block_vpc

  tags           = {
    Name         = "${var.prefix}-vpc"
    Created_by   = "${var.prefix}"
    Date         = timestamp()
  }
}