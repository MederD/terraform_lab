#----------------Key-pair to SSH 
resource "aws_key_pair" "my_new_terraform_key" {
  key_name   = var.key_name
  public_key = file(var.ssh_key_path_pub)
}