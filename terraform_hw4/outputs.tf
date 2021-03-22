output "instance_public_ip" {
  value       = module.myapp-webserver.instance_public_ip
  description = "The public IP address of the public server instance."
}

output "db_instance_endpoint" {
  value       = module.myapp-db.rds_endpoint
  description = "The public IP address of the public server instance."
}