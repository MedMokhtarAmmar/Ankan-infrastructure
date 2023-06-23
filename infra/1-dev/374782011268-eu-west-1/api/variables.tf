variable "api_subdomain" {
  description = "TF states idp key"
}

#project variable
variable "aws_region" {
  description = "AWS region"
}
variable "provider_env_roles" {
  description = "the role to be assumed"
}
variable "app_name" {
  description = "Application name"
}
variable "lambda_api_function_name" {
  description = "lambda_api_function_name"
}
variable "cognito_user_pool_arn" {
  description = "cognito_user_pool_arn"
}
variable "authorizer_provider_arns" {
  description = "user_pool_arn"
}
variable "lambda_api_arn" {
  description = "lambda_api_invoke_arn"
}

variable "lambda_api_function_alias" {
  description = "lambda_api_function_name"
}
