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
  api_subdomain               = "api-uat.ankan.fr"
  provider_env_roles          = "arn:aws:iam::596290292139:role/OrganizationAccountAccessRole"
  aws_region                  = "eu-west-1"
  tfstates_bucket             = "atn-tfstates"
  tfstates_network_key        = "928072895430/projects/ankan/network-uat.tfstate"
  tfstates_acm_key            = "596290292139/us-east-1/projets/ankan/api-acm-certificate.tfstate"
  cert_arn = dependency.acm.outputs.cert_api_arn
  route53_fqdn = dependency.route53.outputs.api_route53_fqdn
}
