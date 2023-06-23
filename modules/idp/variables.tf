
#project variable
variable "aws_region" {
  description = "AWS region"
}
variable "app_name" {
  description = "Application name"
}

variable "provider_env_roles" {
  description = "the role to be assumed"
}
variable "upload_bucket_name" {
  description = ""
}
variable "allowed_origins" {
  type = list(string)
  default = ["*"]
}
variable "identity_pool_name" {
  description = ""
}
variable "amazoncognito_name" {
  description = ""
}
variable "name" {
  description = ""
}
variable "description" {
  description = ""
}
variable "precedence" {
  description = ""
}
