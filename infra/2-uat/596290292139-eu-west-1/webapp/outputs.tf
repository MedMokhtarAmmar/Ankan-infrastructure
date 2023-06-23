# Outputs FRONT

output "s3_bucket_id" {
  value = module.webapp.s3_bucket_id
}

output "s3_bucket_arn" {
  value = module.webapp.s3_bucket_arn
}

output "s3_website_endpoint" {
  value = module.webapp.s3_domain
}
