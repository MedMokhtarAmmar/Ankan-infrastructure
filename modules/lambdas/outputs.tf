output "lambda_api_arn" {
  value = aws_lambda_function.api.arn
}
output "lambda_api_invoke_arn" {
  value = aws_lambda_alias.api_dev.invoke_arn
}
output "lambda_api_alias_dev" {
  value = aws_lambda_alias.api_dev.name
}

output "lambda_api_function_name" {
  value = aws_lambda_function.api.function_name
}
