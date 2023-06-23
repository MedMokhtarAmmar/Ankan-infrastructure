include {
  path = find_in_parent_folders()
}
dependency "acm" {
  config_path = "../../622585044388-us-east-1/api-acm-certificate"
}
dependency "acm_validation" {
  config_path = "../../622585044388-us-east-1/api-acm-validation"
}

inputs = {
  aws_region                  = "eu-west-1"
  tfstates_bucket             = "atn-tfstates"
  tfstates_domains_key        = "928072895430/fondation/domains.tfstate"
  provider_env_roles          = ""
  front_subdomain             = "app.ankan.fr"
  api_subdomain               = "api.ankan.fr"
  cert_api_arn  = dependency.acm.outputs.cert_api_arn
  api_gateway_domain_name = dependency.acm_validation.outputs.api_gateway_domain_name
  api_gateway_zone_id = dependency.acm_validation.outputs.api_gateway_zone_id
}
