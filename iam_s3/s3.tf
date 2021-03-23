# Will create new S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"
  force_destroy = true
  
  tags         = {
    Name       = "${var.prefix}-S3"
    Created_by = "Terraform"
  }
}
