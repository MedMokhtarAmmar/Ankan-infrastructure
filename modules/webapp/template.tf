
locals {
  template_file= file("${path.module}/template/config.json")

  template_vars = {
    api_url = var.api_subdomain
    mandatory = true
    upload_bucket_name = data.terraform_remote_state.idp.outputs.upload_bucket_name
    upload_bucket_region = var.aws_region
    identityPoolId = data.terraform_remote_state.idp.outputs.idendity_pool_id
    amplify_region = var.aws_region
    amplify_client_id = data.terraform_remote_state.idp.outputs.app_client_id
    amplify_pool_id = data.terraform_remote_state.idp.outputs.user_pool_id
  }
}
data "template_file" "template" {
  template = local.template_file
  vars = local.template_vars
}



