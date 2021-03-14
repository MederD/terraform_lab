variable "my_ip" { 
    type        = list(string)
    default     = ["0.0.0.0/0"]
    description = "My IP"
}

variable "vpc_id" {
    type        = string 
    default     = "vpc-eaf61597"
    description = "Default vpc id"
}

variable "security_group_id" {
    default     = "sg-0090ef6c02e185476"
    description = "22 open to my IP"
}

variable "subnet_id" {
    type        = string
    default     = "subnet-a8964b89"
    description = "Default subnet A id"
}

variable "key_name" {
    type        = string
    description = "Keyname"
    sensitive   = true
}

variable "user_name" {
    type        = string
    description = "default username to access aws instance"
    default     = "ec2-user"
    sensitive   = true
}

variable "region" {
    type        = string
    default     = "us-east-1"
    description = "default region"
}
  
variable "instance_type" {
    default     = "t2.micro"
    type        = string
    description = "Default instance type"
}

variable "prefix" {
    type        = string
    description = "Prefix for tags"
}
