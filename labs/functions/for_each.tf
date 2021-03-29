
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


# data "local_file" "input" {
#   filename = file("./servers.txt")
# }

# resource "null_resource" "test" {
#   for_each = data.local_file.input.content
#   triggers = {
#     name   = each.key
#     ip     = each.key
#   }
# }
# output "ip" {
#   value = null_resource.test
# }