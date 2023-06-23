include {
  path = find_in_parent_folders()
}

dependency "cognito" {
  config_path = "../idp"
}
dependency "apigateway" {
  config_path = "../api"
}


inputs = {
  aws_region                  = "eu-west-1"

  app_name                    = "ankan-uat"
  provider_env_roles          = "arn:aws:iam::596290292139:role/OrganizationAccountAccessRole"
  project_version             = "0.0.3"
  callback_urls               = "https://app-uat.ankan.fr"
  logout_urls                 = "https://app-uat.ankan.fr"
  domain_name                 = dependency.cognito.outputs.domain_name
  subdomain                   = dependency.apigateway.outputs.api_gw_invoke_url
  app_client_id               = dependency.cognito.outputs.app_client_id
  idendity_pool_id            = dependency.cognito.outputs.idendity_pool_id
  upload_bucket_name          = dependency.cognito.outputs.upload_bucket_name
  user_pool_id                = dependency.cognito.outputs.user_pool_id
  oauth_procedure             = dependency.cognito.outputs.oauth_procedure
  source_folder               = "app-gitlab/"
}
