resource "aws_cognito_user_group" "main" {
  name = var.name
  user_pool_id = var.user_pool_id
  description = var.description
  precedence = var.precedence
  role_arn = var.role_arn

}




