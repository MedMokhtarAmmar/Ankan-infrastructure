terraform {
  backend "http" {}
}




module "lambdas" {
  source = "git::https://git@gitlab.com/commons-acp/terraform/aws/lambda?ref=v1.0.0"
  aws_region           = var.aws_region
  provider_env_roles   = var.provider_env_roles
  function_name        = var.app_name
  lambda_file_path     = "${abspath(path.root)}/${var.file_name}"
  lambda_role_arn      = data.terraform_remote_state.roles.outputs.lambda_role
  file_name            = var.file_name
  gitlab_api_token     = var.gitlab_api_token
  lambda_env           = local.lambda_env
  gitlab_package_url   = "https://gitlab.com/api/v4/projects/21268122/packages/maven/com/atn/ankan/${var.project_version}/ankan-${var.project_version}.zip"
  providers = {
    aws = aws.main
  }
}
