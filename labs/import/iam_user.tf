resource "aws_iam_user" "user1" {
  name = "user1"
  tags = { "foo" = "bar" }
}

# terraform import aws.iam_user.user1 user1