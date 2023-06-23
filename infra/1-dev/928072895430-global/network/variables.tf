#fondation
variable "tfstates_bucket" {
  description = "TF states buckets"
}
variable "tfstates_domains_key" {
  description = "TF states users key"
}
variable "tfstates_acm_validation_key" {
  description = "TF states users key"
}

variable "provider_env_roles" {
  description = "the role to be assumed"
}
#project variable
variable "aws_region" {
  description = "AWS region"
}
variable "tfstates_acm_key" {
  description = ""
}

# front
variable "front_subdomain" {
  description = "The front subdomain"
}
#API
variable "api_subdomain" {
  description = "The api subdomain"
}

variable "api_gateway_domain_name" {
  description = "api_gateway_domain_name"
}
variable "api_gateway_zone_id" {
  description = "api_gateway_zone_id"
}
