output "user_pool_arn" {
  value = aws_cognito_user_pool.user_pool.arn
}
output "user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}
output "app_client_id" {
  value = aws_cognito_user_pool_client.client.id
}
output "idendity_pool_id" {
  value = aws_cognito_identity_pool.main.id
}
output "upload_bucket_name" {
  value = aws_s3_bucket.upload_bucket.bucket
}