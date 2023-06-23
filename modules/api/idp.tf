resource "aws_api_gateway_authorizer" "api_gateway_authorizer" {
  name                   = "${var.app_name}-authorizer"
  rest_api_id            = aws_api_gateway_rest_api.api_gw.id
  identity_source = "method.request.header.Authorization"
  type = "COGNITO_USER_POOLS"
  provider_arns = [data.terraform_remote_state.idp.outputs.user_pool_arn]
}
