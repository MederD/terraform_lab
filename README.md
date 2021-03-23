## terraform lab


[Basic infrastracture with terraform](https://github.com/MederD/terraform_sprintqa/tree/main/session_1)  
us-east-1 region infrastructure provisioning with terraform using variables:  

    Ec2 Instance (Amazon EC2 ami)  
    Own VPC created  
    2 Subnets (publc and private)  
    Internet Gateway  
    Route tables (public and private)  
    Route associations  
    Security Groups - Open 22,80 and 443 port for public and Public Subnet CIDR for private subnet to ping.  
    Get an output  

[Data source with terraform](https://github.com/MederD/terraform_sprintqa/tree/main/terraform_data_source)  
Create basic infrastructre with use of data sources:    
* Public Ec2 instance with default VPC, subnet and security group.  

[Module stack](https://github.com/MederD/terraform_sprintqa/tree/main/modules)  
Create VPC and "web-server" instance template as a module:  
* Mapped AMI images for other regions.
* Create 2 or more subnets with AZ.   

[RDS DB in private subnet with public bastion host](https://github.com/MederD/terraform_sprintqa/tree/main/database_terraform)  
Create EC2 instance in public subnet and RDS instance in private subnet:   
* Mapped AMI images for other regions.
* Create 2 or more subnets with AZ (public and private)
* RDS instance in private subnet 
* Public instance used as a bastion host
   


