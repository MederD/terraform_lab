locals {
  type = {"web" = "t2.micro"
          "dev" = "t2.small"}

}
variable "multiple_web_servers" {
    default = true
}

resource "aws_instance" "web" {
  count                  = var.multiple_web_servers == "true" ? 3:1
  ami                    = "ami-038f1ca1bd58a5790"
  instance_type          = element([for i, z in local.type: z if i == "web"], 0)
}

output "test" {
  value = aws_instance.web.*.instance_type
}