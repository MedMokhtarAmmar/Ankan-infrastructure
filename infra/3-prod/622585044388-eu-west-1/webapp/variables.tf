variable "aws_region" {
  description = "AWS region"
}
variable "provider_env_roles" {
  description = "the role to be assumed"
}
variable "app_name" {
  description = "Application name"
}

variable "source_folder" {
  description = ""
}
variable "gitlab_api_token" {
  description = "gitlab api token"
}

variable "subdomain"{
  description = "api subdomain"
}
variable "app_client_id"{
  description = "app_client_id"
}
variable "idendity_pool_id"{
  description = "idendity_pool_id"
}
variable "upload_bucket_name"{
  description = "upload_bucket_name"
}
variable "user_pool_id"{
  description = "user_pool_id"
}
variable "project_version"{
  description = "project_version"
}
variable "oauth_procedure" {
  description = ""
}
variable "oauth" {
  default = false
  description = ""
}
variable "domain_name" {
  description = ""
}
variable "callback_urls" {
  description = ""
}
variable "logout_urls" {
  description = ""
}
