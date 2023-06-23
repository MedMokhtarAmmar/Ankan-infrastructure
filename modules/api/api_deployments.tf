resource "aws_api_gateway_deployment" "gw_deploy" {
  rest_api_id = aws_api_gateway_rest_api.api_gw.id
  lifecycle {
    create_before_destroy = true
  }
  stage_description = uuid()
}
resource "aws_api_gateway_method_settings" "settings" {
  rest_api_id = aws_api_gateway_rest_api.api_gw.id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  method_path = "*/*"


  settings  {
    # Set throttling values
    throttling_burst_limit = 10
    throttling_rate_limit  = 50

    logging_level = "INFO"
    data_trace_enabled = true
    metrics_enabled = true

  }
}
resource "aws_api_gateway_stage" "stage" {
  depends_on = [aws_cloudwatch_log_group.apigw_stage]

  stage_name    = "stage"
  rest_api_id   = aws_api_gateway_rest_api.api_gw.id
  deployment_id = aws_api_gateway_deployment.gw_deploy.id
  variables = {
    stage_name="stage"
  }
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.apigw_stage.arn
    format = "{ \"requestId\":\"$context.requestId\", \"ip\": \"$context.identity.sourceIp\", \"caller\":\"$context.identity.caller\", \"user\":\"$context.identity.user\",\"requestTime\":\"$context.requestTime\", \"httpMethod\":\"$context.httpMethod\",\"resourcePath\":\"$context.resourcePath\", \"status\":\"$context.status\",\"protocol\":\"$context.protocol\", \"responseLength\":\"$context.responseLength\" }"
  }
}
resource "aws_cloudwatch_log_group" "apigw_stage" {
  name = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.api_gw.id}/stage"
  retention_in_days = 1
}
/*
resource "aws_api_gateway_base_path_mapping" "api_basepath_dev" {
  api_id      = aws_api_gateway_rest_api.api_gw.id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  domain_name = var.api_subdomain
}*/
##############
