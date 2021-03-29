module "iam" {
  source = "./demo_module"  

  user_name = "user1"
  group_name = "demo"
  tags = { "foo" = "bar" }
}

# terraform import module.iam.aws_iam_user.user user1