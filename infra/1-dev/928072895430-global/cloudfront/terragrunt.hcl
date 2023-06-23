include {
  path = find_in_parent_folders()
}
dependency "webapp" {
  config_path = "../../account-id-eu-west-1/webapp"
}
dependency "network" {
  config_path = "../network"
}

inputs ={

  website_endpoint= dependency.webapp.outputs.s3_website_endpoint
  ssl_certificate_arn= dependency.network.outputs.app_certificate_arn
  aws_region                  = "eu-west-1"
  tfstates_bucket             = "atn-tfstates"
  tfstates_domains_key        = "928072895430/fondation/domains.tfstate"
  front_subdomain             = "app-dev.ankan.fr"
  api_subdomain               = "api-dev.ankan.fr"
  tfstates_acm_key            = "374782011268/us-east-1/projets/ankan/api-acm-certificate.tfstate"

}
