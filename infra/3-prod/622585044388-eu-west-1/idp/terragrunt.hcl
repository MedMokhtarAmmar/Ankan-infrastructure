include {
  path = find_in_parent_folders()
}
inputs = {
  app_name                = "ankan-prod"
  logout_urls             = "https://app.ankan.fr"
  callback_urls           = "https://app.ankan.fr"
  facebook_client_secret  = "83c3dd30b0d36adc676cf5aeec2b90bb"
  facebook_client_id      = "163591675623315"
  facebook_api_version    = "v10.0"
  identity_pool_name      = "identity_pool_ankan"
  upload_bucket_name      = "ankan-uploads-prod"
}