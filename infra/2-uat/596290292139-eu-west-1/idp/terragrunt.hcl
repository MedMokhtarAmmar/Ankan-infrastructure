include {
  path = find_in_parent_folders()
}
inputs = {
  app_name                = "ankan-uat"
  logout_urls             = "https://app-uat.ankan.fr"
  callback_urls           = "https://app-uat.ankan.fr"
  facebook_client_secret  = "653b3e9d29d95eac4d2a8cfe9ec5b643"
  facebook_client_id      = "945100302967295"
  facebook_api_version    = "v10.0"
  identity_pool_name      = "identity_pool_ankan"
  upload_bucket_name      = "ankan-uploads-uat"
}