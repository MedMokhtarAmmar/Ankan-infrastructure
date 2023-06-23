#fondation
variable "tfstates_bucket" {
  description = "TF states buckets"
}
variable "tfstates_domains_key" {
  description = "TF states users key"
}
variable "aws_region" {
  description = "AWS region"
}
variable "acm_api_resource_record_type" {
  description = "acm_api_resource_record_type"
}
variable "acm_api_resource_record_value" {
  description = "acm_api_resource_record_value"
}
variable "api_acm_resource_record_name" {
  description = "api_acm_resource_record_name"
}
