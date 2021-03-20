variable "my_ip" { 
    type            = list(string)
    description     = "My IP"
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

variable "region" {}
variable "instance_type" {}
variable "prefix" {}
variable "subnet_id" {}
variable "vpc_id" {}