variable "my_ip" { 
    type            = list(string)
    description     = "My IP range to SSH"
}

variable "key_name" {
    type            = string
    sensitive       = true
    description     = "Keyname will be created"
}

variable "user_name" {
    type            = string
    sensitive       = true
    description     = "Username to SSH"
}

variable "ami_name" {
    type            = map
    description     = "Default region based AMIs"
} 

variable "region" {
    type            = string
    description     = "Region for the aws resources."
}

variable "prefix" {
    type            = string
    description     = "Prefix for resource tags."
}

variable "instance_type" {
    type            = string
    description     = "Instance type, ex: t2.micro."
}

variable "subnet_id" {
    description     = "Subnet for public instance"
}

variable "vpc_id" {
    description     = "VPC for public instance"
}

variable "db_port" {
    type            = number
    description     = "Ingress port for communication with DB instance"
}

variable "sub_cidr_private" {
    description     = "Subnet for private instance, this is for ingress cidr range"
}

variable "ssh_key_path" {
    type            = string
    description     = "Private key path"
}

variable "ssh_key_path_pub" {
    type            = string
    description     = "Public key path"
}

variable "count" {
    type            = number
    description     = "Count number for EC2 instances"
}