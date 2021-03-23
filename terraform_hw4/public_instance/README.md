## AWS Public EC2 Instance Terraform module  
### Terraform module which creates public EC2 resource on AWS.

**Provision Instructions:**

Copy and paste into your Terraform configuration, insert the variables, and run terraform init:  

```
module "public_instance" {
  source  = "github.com/MederD/terraform_sprintqa/tree/main/terraform_hw4/public_instance"

  * insert variables here
}
```

**Created resources:**  
* EC2 instance with public IP.
* Security Group allowing traffic on ports 80, 443, 22 and 3306 for MySQL connection.
* Key-pair for connection

**Variables for configuration:**  
```
my_ip                   
key_name                
user_name               
ami_name               
region                  
prefix                  
instance_type           
subnet_id               
vpc_id                  
db_port                 
sub_cidr_private       
ssh_key_path            
ssh_key_path_pub                 
```



