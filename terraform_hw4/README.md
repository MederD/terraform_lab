### This project includes using VPC module, Public EC2 instance module and Database module.  

[Module VPC](https://github.com/MederD/terraform_sprintqa/tree/main/terraform_hw4/network_infrastracture)  
Creates below resources:  
* VPC
* Subnets (public and private)
* Internet Gateway
* Route tables (public and private) 

-----
[Module Public EC2 Instance](https://github.com/MederD/terraform_sprintqa/tree/main/terraform_hw4/public_instance)  
Creates below resources:   
* EC2 instance with public IP.
* Security Group allowing traffic on ports 80, 443, 22 and 3306 for MySQL connection.
* Key-pair for connection   

-----
[Module Database](https://github.com/MederD/terraform_sprintqa/tree/main/terraform_hw4/db_instance)  
Creates below resources:   
* Database instance.
* Security Group allowing traffic on ports 80 and 3306 for EC2 connection.
* Subnet group