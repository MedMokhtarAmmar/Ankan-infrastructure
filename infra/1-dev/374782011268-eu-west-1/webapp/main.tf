terraform {
  backend "http" {
  }
  required_providers {
    atn-utils = {
      source = "allence-tunisie/atn-utils"
    }
  }
}


module "webapp" {
  source = "git::http://git@gitlab.com/commons-acp/terraform/aws/s3-webapp-angular?ref=v1.0.3"
  app_name = var.app_name
  config_json_content = data.template_file.template.rendered
  gitlab_api_token = var.gitlab_api_token
  gitlab_package_url = "https://gitlab.com/api/v4/projects/21268100/packages/maven/com/atn/ankan/${var.project_version}/ankan-${var.project_version}.zip"
  providers = {
    aws = aws
    atn-utils = atn-utils
  }
}

