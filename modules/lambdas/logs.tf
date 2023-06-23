resource "aws_cloudwatch_log_group" "lambda_api" {
  name = "/aws/lambda/${aws_lambda_function.api.function_name}"
  retention_in_days = 1
}
