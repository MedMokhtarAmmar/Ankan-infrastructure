output "cert_api_arn" {
  value = module.acm.cert_arn
}


output "acm_api_resource_record_type" {
  value = module.acm.api_resource_record_type
}
output "acm_api_resource_record_value" {
  value = module.acm.api_resource_record_value
}
output "api_acm_resource_record_name" {
  value = module.acm.acm_resource_record_name
}
output "api_gateway_domain_name" {
  value = module.acm.cert_domain_name
}

