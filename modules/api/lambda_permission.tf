resource "aws_lambda_permission" "lambda_dev" {
  statement_id = "API_AllowAPIGatewayInvoke_dev"
  action = "lambda:InvokeFunction"
  function_name = data.terraform_remote_state.lambdas.outputs.lambda_api_function_name
  principal = "apigateway.amazonaws.com"
  qualifier = "dev"
  source_arn = "${aws_api_gateway_rest_api.api_gw.execution_arn}/*/*"
  lifecycle {
    create_before_destroy = true
  }
}
