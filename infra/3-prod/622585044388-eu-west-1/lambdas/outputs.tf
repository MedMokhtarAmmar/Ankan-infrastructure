# Outputs LAMBDA
output "lambda_api_arn" {
  value = module.api.lambda_api_arn
}
output "lambda_api_invoke_arn" {
  value = module.api.lambda_api_invoke_arn
}
output "lambda_api_alias_dev" {
  value = module.api.lambda_api_alias
}
output "lambda_api_function_name" {
  value = module.api.lambda_api_function_name
}
output "aceessTokenstate" {
  value = module.api.aceessTokenstate
}
output "repository_urlState" {
  value = module.api.repository_urlState
}
