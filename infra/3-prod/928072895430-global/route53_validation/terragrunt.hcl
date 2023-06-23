include {
  path = find_in_parent_folders()
}
dependency "acm" {
  config_path = "../../622585044388-us-east-1/api-acm-certificate"
}

inputs = {
  aws_region                  = "eu-west-1"
  tfstates_bucket             = "atn-tfstates"
  tfstates_domains_key        = "928072895430/fondation/domains.tfstate"
  cert_api_arn  = dependency.acm.outputs.cert_api_arn
  acm_api_resource_record_type  = dependency.acm.outputs.acm_api_resource_record_type
  acm_api_resource_record_value = dependency.acm.outputs.acm_api_resource_record_value
  api_acm_resource_record_name  = dependency.acm.outputs.api_acm_resource_record_name

}
