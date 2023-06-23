terraform {
  backend "http" {
  }
}
module "api" {
  source = "git::https://git@gitlab.com/commons-acp/terraform/aws/apigateway?ref=v1.0.6"

  app_name = var.app_name
  api_subdomain =  var.api_subdomain
  swagger_file_path  = "swagger/api.yaml"
  lambda_api_function_name = var.lambda_api_function_name
  lambda_api_function_alias = var.lambda_api_function_alias
  authorizer_provider_arns = [var.authorizer_provider_arns]
  api_template_vars = {
    region = var.aws_region
    cognito_user_pool_arn = var.cognito_user_pool_arn
    lambda_api_arn = var.lambda_api_arn
    lambda_timeout = 10000
  }
  providers = {
    aws=aws
  }

}
