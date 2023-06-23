output "user_pool_arn" {
  value = module.idp.user_pool_arn
}
output "user_pool_id" {
  value = module.idp.user_pool_id
}
output "app_client_id" {
  value = module.idp.app_client_id
}
output "idendity_pool_id" {
  value = module.idp.idendity_pool_id
}

output "upload_bucket_name" {
  value = module.idp.upload_bucket_name
}
output "domain_name" {
  value = module.idp.domain_name
}
output "oauth_procedure" {
  value = module.idp.oauth_procedure
}
