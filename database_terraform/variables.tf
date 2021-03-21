# Public subnet variables
variable "sub_cidr_block" {
    type            = list(string)
    description     = "The CIDR block for the subnets."
}

variable "az" {
	type            = list(string)
    description     = "Availibility zones for the subnets."
}

variable "ssh_key_path" {}
variable "ssh_key_path_pub" {}

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

# Database variables
variable "db_storage" {}
variable "db_engine" {}
variable "db_engine_ver" {}
variable "db_instance_class" {}
variable "db_name" {}
variable "db_port" {}
variable "db_multi_az" {}
variable "db_publicly_accessible" {}
variable "db_storage_encrypted" {}

variable "db_username" {
    sensitive       = true
}

variable "db_password" {
    sensitive       = true
}
