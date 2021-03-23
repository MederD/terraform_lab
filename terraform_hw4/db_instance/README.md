## AWS Database Instance Terraform module  
### Terraform module which creates Database resource on AWS.

**Provision Instructions:**

Copy and paste into your Terraform configuration, insert the variables, and run terraform init:  

```
module "database_instance" {
  source  = "github.com/MederD/terraform_sprintqa/tree/main/terraform_hw4/db_instance"

  * insert variables here
}
```

**Created resources:**  
* Database instance.
* Security Group allowing traffic on ports 80 and 3306 for EC2 connection.
* Subnet group

**Variables for configuration:**  
```
db_identifier           
db_storage              
db_engine               
db_engine_ver          
db_instance_class      
db_name                 
db_port                 
db_multi_az             
db_username             
db_password             
db_publicly_accessible  
db_storage_encrypted    
my_private_subnets_ids                  
```



