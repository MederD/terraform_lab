
# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block     = var.cidr_block_vpc

  tags = {
    "Name"       = "my_new_vpc"
    "Env"        = "Dev"
    "Created_by" = "${var.prefix} Terraform"
  }
}