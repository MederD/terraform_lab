variable "sub_cidr_block" {
    type            = list(string)
    description     = "The CIDR block for the subnets."
}

variable "az" {
	type            = list(string)
    description     = "Availibility zones for the subnets."
}

variable "key_name" {
    sensitive       = true
}

variable "user_name" {
    sensitive       = true
}

variable "ami_name" {
    type            = map
    description     = "Default region based AMIs"
}  

variable "cidr_block_vpc" {}
variable "instance_type" {}
variable "prefix" {}
variable "region" {}
variable "my_ip" { 
    type            = list(string)
    description     = "My IP"
}