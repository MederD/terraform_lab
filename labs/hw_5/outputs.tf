output "alb_dns_name" {
  value         = module.alb.this_lb_dns_name
  description   = "The DNS name of the load balancer."
}

output "instance_public_ip" {
  value         = module.public_instance.instance_public_ip
  description   = "The public IP address of the public server instance."
}