#fondation
variable "tfstates_bucket" {
  description = "TF states buckets"
}

variable "tfstates_roles_key" {
  description = "TF states roles key"
}
#project variable
variable "aws_region" {
  description = "AWS region"
}
variable "provider_env_roles" {
  description = "the role to be assumed"
}
variable "function_name" {
  description = "Lambda Name"
}
variable "lambda_file_path" {
  description = "Lambda function Path"
}
variable "string_uri" {
  description = ""
}
