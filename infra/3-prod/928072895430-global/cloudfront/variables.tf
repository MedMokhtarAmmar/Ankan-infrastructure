#fondation
variable "tfstates_bucket" {
  description = "TF states buckets"
}
variable "tfstates_domains_key" {
  description = "TF states domains key"
}

#project variable
variable "aws_region" {
  description = "AWS region"
}

# front
variable "front_subdomain" {
  description = "The front subdomain"
}
#API
variable "api_subdomain" {
  description = "The api subdomain"
}

variable "website_endpoint" {
  description = ""
}
variable "ssl_certificate_arn" {
  description = ""
}