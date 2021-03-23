
resource "aws_key_pair" "mykeypair" {
  key_name   = var.key_name
  public_key = file(var.ssh_key_path_pub)
}