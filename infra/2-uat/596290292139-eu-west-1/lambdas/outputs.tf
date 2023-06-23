# Outputs LAMBDA
output "lambda_api_arn" {
  value = module.lambdas.lambda_api_arn
}
output "lambda_api_invoke_arn" {
  value = module.lambdas.lambda_api_invoke_arn
}
output "lambda_api_alias_dev" {
  value = module.lambdas.lambda_api_alias
}
output "lambda_api_function_name" {
  value = module.lambdas.lambda_api_function_name
}
output "aceessTokenstate" {
  value = module.lambdas.aceessTokenstate
}
output "repository_urlState" {
  value = module.lambdas.repository_urlState
}
