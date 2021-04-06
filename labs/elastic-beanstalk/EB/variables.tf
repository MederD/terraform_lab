variable "region" {}
variable "vpc_cidr_block" {}
variable "public_subnet_count" {}
variable "public_subnet_cidr" {}
variable "azone" {}
variable "RDS_PASSWORD" {}
variable "domain" {}
variable "subdomain" {}
variable "key_name" {}
variable "loadbalancer_certificate_arn" {}
variable "http_listener_enabled" {}

locals {
  common_prefix = "demo"
}