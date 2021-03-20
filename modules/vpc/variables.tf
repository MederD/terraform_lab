variable "sub_cidr_block" {
    type        = list(string)
    description = "The CIDR block for the subnets."
}

variable "az" {
	type        = list(string)
    description = "Availibility zones for the subnets."
}

variable "cidr_block_vpc" {}
variable "prefix" {}