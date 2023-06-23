include {
  path = find_in_parent_folders()
}
dependency "lambda" {
  config_path = "../lambdas"
}
dependency "cognito" {
  config_path = "../idp"
}
inputs ={
  aws_region                  = "eu-west-1"
  api_subdomain               = "api-uat.ankan.fr"
  app_name                    = "ankan-uat"
  provider_env_roles          = "arn:aws:iam::596290292139:role/OrganizationAccountAccessRole"

  lambda_api_function_name  = dependency.lambda.outputs.lambda_api_function_name
  lambda_api_function_alias = dependency.lambda.outputs.lambda_api_alias_dev
  authorizer_provider_arns  = dependency.cognito.outputs.user_pool_arn
  cognito_user_pool_arn     = dependency.cognito.outputs.user_pool_arn
  lambda_api_arn            = dependency.lambda.outputs.lambda_api_invoke_arn
}
