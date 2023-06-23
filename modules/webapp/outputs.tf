# Outputs FRONT

output "s3_bucket_id" {
  value = aws_s3_bucket.main.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.main.arn
}

output "s3_domain" {
  value = "${aws_s3_bucket.main.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}




