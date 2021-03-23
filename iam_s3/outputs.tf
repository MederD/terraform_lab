# Output
output "instance_public_ip" {
  value       = aws_instance.my_pub_instance.*.public_ip
  description = "The public IP address of the public server instance."
}