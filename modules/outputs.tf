output "instance_public_ip" {
  value       = module.myapp_web_server.instance_public_ip
  description = "The public IP address of the public server instance."
}