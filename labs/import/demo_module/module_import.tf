# MODULE INPUTS

variable "user_name" {}
variable "group_name" {}
variable "tags" {}

# MODULE RESOURCES
resource "aws_iam_user" "user" {
  name = var.user_name
  tags = var.tags
}

resource "aws_iam_user_login_profile" "profile" {
  user    = aws_iam_user.user.name
  pgp_key = "keybase:<keybase_name>" # outside our scope

}

resource "aws_iam_group" "group" {
  name = var.group_name
}
resource "aws_iam_user_group_membership" "membership" {
  user = aws_iam_user.user.name  
  groups = [
    aws_iam_group.group.name,
  ]
}