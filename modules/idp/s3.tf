
resource "aws_s3_bucket" "upload_bucket" {

  bucket   = var.upload_bucket_name
  acl      = "private"
  force_destroy = false
  tags = merge({ "Name" = var.upload_bucket_name })
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST" ,"HEAD" , "DELETE" , "GET"]
    allowed_origins = var.allowed_origins
    expose_headers  = ["ETag","x-amz-server-side-encryption","x-amz-request-id" , "x-amz-id-2"]
    max_age_seconds = 3000
  }
}

