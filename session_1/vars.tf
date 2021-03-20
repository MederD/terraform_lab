variable "my_ip" { 
    type        = list(string)
    default     = ["0.0.0.0/0"]
    description = "My IP"
}

variable "cidr_block_vpc" {
    type        = string
    default     = "10.0.0.0/16"
    description = "CIDR range for non-default VPC"
}

variable "sub_cidr_block" {
    type        = list(string)
    default     = ["10.0.1.0/24",
                   "10.0.2.0/24"]
    description = "The CIDR block for the subnets."
}

variable "az" {
	type        = list(string)
	default     = ["us-east-1a", "us-east-1b"]
    description = "Availibility zones for the subnets."
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

variable "ami_name" {
    type            = map
    default         = {
        "us-east-1" = "ami-038f1ca1bd58a5790"
        "us-east-2" = "ami-07a0844029df33d7d"
    }
    description = "Default us-east-1 AMI"

    # validation {
    #     condition = (
    #       length(var.ami_name) > 4 &&
    #       substr(var.ami_name, 0, 4) == "ami-"
    #     )
    #     error_message = "The ami_id value must start with \"ami-\"."
    #   }
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
#terraform apply -var 'key_name=enter key name'