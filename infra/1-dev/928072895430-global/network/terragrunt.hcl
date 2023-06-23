include {
  path = find_in_parent_folders()
}
dependency "acm" {
  config_path = "../../account-id-us-east-1/api-acm-certificate"
}
dependency "acm_validation" {
  config_path = "../../account-id-us-east-1/api-acm-validation"
}

inputs = {
  cert_api_arn  = dependency.acm.outputs.cert_api_arn
  api_gateway_domain_name = dependency.acm_validation.outputs.api_gateway_domain_name
  api_gateway_zone_id = dependency.acm_validation.outputs.api_gateway_zone_id
  aws_region = "eu-west-1"
  tfstates_bucket = "atn-tfstates"
  tfstates_domains_key = "928072895430/fondation/domains.tfstate"
  tfstates_acm_key = "374782011268/us-east-1/projets/ankan/api-acm-certificate.tfstate"
  tfstates_acm_validation_key = "374782011268/us-east-1/projets/ankan/api-acm-validation.tfstate"
  provider_env_roles = ""
  front_subdomain = "app-dev.ankan.fr"
  api_subdomain = "api-dev.ankan.fr"

}
