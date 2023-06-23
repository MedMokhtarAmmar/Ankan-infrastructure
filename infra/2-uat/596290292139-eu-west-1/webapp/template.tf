data "template_file" "template" {
  template = var.oauth_procedure ? file("config/config_oauth.json") : file("config/config.json")
  vars = var.oauth_procedure ? {
    api_url = var.subdomain
    mandatory = true
    upload_bucket_region = var.aws_region
    amplify_region = var.aws_region

    upload_bucket_name  = var.upload_bucket_name
    identityPoolId      = var.idendity_pool_id
    amplify_client_id   = var.app_client_id
    amplify_pool_id     = var.user_pool_id

    domain_name         = var.domain_name
    callback_urls       = var.callback_urls
    logout_urls         = var.logout_urls
    aws_region         = var.aws_region
  }:{
    api_url = var.subdomain
    mandatory = true
    upload_bucket_region = var.aws_region
    amplify_region = var.aws_region

    upload_bucket_name  = var.upload_bucket_name
    identityPoolId      = var.idendity_pool_id
    amplify_client_id   = var.app_client_id
    amplify_pool_id     = var.user_pool_id
  }
}
