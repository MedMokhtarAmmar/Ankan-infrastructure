include {
  path = find_in_parent_folders()
}
inputs = {
  provider_env_roles          = "arn:aws:iam::596290292139:role/OrganizationAccountAccessRole"
  aws_region                  = "eu-west-1"
  tfstates_bucket             = "atn-tfstates"
  tfstates_domains_key        = "928072895430/fondation/domains.tfstate"
  api_subdomain               = "api-uat.ankan.fr"

}