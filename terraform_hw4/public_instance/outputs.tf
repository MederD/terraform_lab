output "instance_public_ip" {
  value       = aws_instance.my_pub_instance.*.public_ip
  description = "The public IP address of the public server instance."
}

output "instance_id" {
  value       = aws_instance.my_pub_instance.*.id
  description = "The ids of the public server instance."
}

output "instance_arn" {
  description = "List of ARNs of instances"
  value       = aws_instance.my_pub_instance.*.arn
}