#fondation
variable "tfstates_bucket" {
  description = "TF states buckets"
}

variable "tfstates_lambdas_key" {
  description = "TF states lambdas key"
}
variable "tfstates_idp_key" {
  description = "TF states idp key"
}

#project variable
variable "aws_region" {
  description = "AWS region"
}
variable "app_name" {
  description = "Application name"
}
variable "api_subdomain" {
  description = "The api subdomain"
}
variable "swagger_file_path" {
  description = "The api swagger path"
}
variable "provider_env_roles" {
  description = "the role to be assumed"
}

variable "api_template_vars" {
  description = "The api swagger vars"
}
