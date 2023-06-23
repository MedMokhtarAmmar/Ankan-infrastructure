include {
  path = find_in_parent_folders()
}
dependency "network" {
  config_path = "../network"
  mock_outputs = {
    #use a mock outputs for validation
    app_certificate_arn = "temporary-dummy-app_certificate_arn"
  }
}

dependency "webapp" {
  config_path = "../../622585044388-eu-west-1/webapp"
}

inputs = {
  website_endpoint= dependency.webapp.outputs.s3_website_endpoint
  ssl_certificate_arn= dependency.network.outputs.app_certificate_arn
  aws_region                  = "eu-west-1"
  tfstates_bucket             = "atn-tfstates"
  tfstates_domains_key        = "928072895430/fondation/domains.tfstate"
  front_subdomain             = "app.ankan.fr"
  api_subdomain               = "api.ankan.fr"
}
