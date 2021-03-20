output "my_vpc" {
  value       = aws_vpc.my_new_vpc
  description = "Output details of my newly crated Vpc"
}

output "my_subnet" {
  value       = aws_subnet.my_pub_subnet_1
  description = "Output details of my newly crated subnet"
}
