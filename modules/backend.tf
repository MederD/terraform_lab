terraform {
  backend "s3" {
    bucket = "cicd-meder-projects"
    key    = "terraform_backend/modules-sample.tfstate"
    region = "us-east-1"
  }
}