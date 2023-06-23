include {
  path = find_in_parent_folders()
}

dependency "acm" {
  config_path = "../api-acm-certificate"
}
dependency "route53" {
  config_path = "../../928072895430-global/route53_validation"
}

inputs = {
  cert_arn = dependency.acm.outputs.cert_api_arn
  route53_fqdn = dependency.route53.outputs.api_route53_fqdn
  api_subdomain               = "api-dev.ankan.fr"
  provider_env_roles          = "arn:aws:iam::374782011268:role/OrganizationAccountAccessRole"
  aws_region                  = "eu-west-1"
  tfstates_bucket             = "atn-tfstates"
  tfstates_network_key        = "928072895430/projects/ankan/network-dev.tfstate"
  tfstates_acm_key            = "374782011268/us-east-1/projets/ankan/api-acm-certificate.tfstate"

}
