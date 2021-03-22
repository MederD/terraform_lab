# ---------------Module for non-default vpc
module "myapp-vpc" {
    source = "./network_infrastracture"

    cidr_block_vpc      = var.cidr_block_vpc
    prefix              = var.prefix
    sub_cidr_public     = var.sub_cidr_public
    sub_cidr_private    = var.sub_cidr_private
    region              = var.region
    az_private          = var.az_private
    az_public           = var.az_public
    instance_tenancy    = var.instance_tenancy
}

# ---------------Module for public instance
module "myapp-webserver" {
    source = "./public_instance"

    key_name            = var.key_name
    ssh_key_path        = var.ssh_key_path
    ssh_key_path_pub    = var.ssh_key_path_pub
    ami_name            = var.ami_name
    user_name           = var.user_name
    instance_type       = var.instance_type
    subnet_id           = module.myapp-vpc.my_public_subnets[0].id
    vpc_id              = module.myapp-vpc.my_vpc.id
    prefix              = var.prefix
    region              = var.region
    sub_cidr_private    = var.sub_cidr_private
    db_port             = var.db_port
    my_ip               = var.my_ip
}

# ---------------Module for DB instance
module "myapp-db" {
    source = "./db_instance"

    # Database variables
    db_identifier           = var.db_identifier
    db_storage              = var.db_storage
    db_engine               = var.db_engine
    db_engine_ver           = var.db_engine_ver
    db_instance_class       = var.db_instance_class
    db_name                 = var.db_name
    db_port                 = var.db_port
    db_multi_az             = var.db_multi_az
    db_publicly_accessible  = var.db_publicly_accessible
    db_storage_encrypted    = var.db_storage_encrypted
    db_username             = var.db_username
    db_password             = var.db_password
    sub_cidr_private        = var.sub_cidr_private
    sub_cidr_public         = var.sub_cidr_public
    vpc_id                  = module.myapp-vpc.my_vpc.id
    region                  = var.region
    prefix                  = var.prefix
    my_private_subnets_ids  = module.myapp-vpc.my_private_subnets[*].id
}