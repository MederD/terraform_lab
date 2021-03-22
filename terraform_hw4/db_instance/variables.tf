# Database variables
variable "db_identifier" {}
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

variable "sub_cidr_private" {}
variable "sub_cidr_public" {}
variable "vpc_id" {}
variable "region" {}
variable "prefix" {}
variable "my_private_subnets_ids" {}
