## AWS VPC Terraform module  

### Terraform module which creates VPC resources on AWS.

**Created resources:**  
* VPC
* Subnets (public and private)
* Internet Gateway
* Route tables (public and private)

**Variables for configuration:**  
```
cidr_block_vpc
region        
prefix                
instance_tenancy      
sub_cidr_public      
sub_cidr_private      
az_public         
az_private          
```

### Provider Dependencies

Providers are Terraform plugins that will be automatically installed during terraform init if available on the Terraform Registry.  
* aws (hashicorp/aws) >= 2.70

