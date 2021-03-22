#----------------Network infrastracture variables
variable "cidr_block_vpc" {}
variable "region" {}
variable "prefix" {}
variable "instance_tenancy" {}
variable "sub_cidr_public" {}
variable "sub_cidr_private" {}
variable "az_public" {}
variable "az_private" {}

# ---------------Public instance variables
variable "my_ip" {}
variable "key_name" {}
variable "user_name" {}
variable "ami_name" {} 
variable "instance_type" {}
variable "ssh_key_path" {}
variable "ssh_key_path_pub" {}

# ---------------Database variables
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
variable "db_username" {}
variable "db_password" {}
