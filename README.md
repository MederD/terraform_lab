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

-----
[Data source with terraform](https://github.com/MederD/terraform_sprintqa/tree/main/terraform_data_source)  
Create basic infrastructre with use of data sources:    
* Public Ec2 instance with default VPC, subnet and security group.  

-----
[Module stack](https://github.com/MederD/terraform_sprintqa/tree/main/modules)  
Create VPC and "web-server" instance template as a module:  
* Mapped AMI images for other regions.
* Create 2 or more subnets with AZ.   

-----
[RDS DB in private subnet with public bastion host](https://github.com/MederD/terraform_sprintqa/tree/main/database_terraform)  
Create EC2 instance in public subnet and RDS instance in private subnet:   
* Mapped AMI images for other regions.
* Create 2 or more subnets with AZ (public and private)
* RDS instance in private subnet 
* Public instance used as a bastion host
   
-----
[Using modules VPC, EC2 Instance and Database](https://github.com/MederD/terraform_sprintqa/tree/main/terraform_hw4)  
Creates VPC, EC2 instance in public subnet and RDS instance in private subnet:
* Mapped AMI images for other regions.
* Create subnets with AZ (public and private)
* RDS instance in private subnet

-----
[Using data source to create S3 bucket, IAM role, inline policy and EC2 instance](https://github.com/MederD/terraform_sprintqa/tree/main/iam_s3)  
This project includes using data sources for creating S3 bucket, IAM role, inline policy and attach to EC2 instance: 
* VPC, which is default 
* Subnet, which is default
* S3 bucket
* IAM role, inline policy and instant_profile to attach to EC2 instance.
* EC2 instance with attached role to access S3 bucket.

