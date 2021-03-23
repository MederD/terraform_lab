# Module ALB
variable "region" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "subnets" {}
variable "security_groups" {}
variable "certificate_arn" {}
variable "prefix" {}

# Module EC2 Instance
variable "my_ip" {}  
variable "ami_name" {}                   
variable "key_name" {}                
variable "user_name" {}                                                        
variable "instance_type" {}                                         
variable "db_port" {}                 
variable "sub_cidr_private" {}       
variable "ssh_key_path" {}            
variable "ssh_key_path_pub" {} 
variable "instance_count" {}