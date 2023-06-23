provider "aws" {
  region = "eu-west-1"
  version = "2.70.0"
  alias = "main"
  assume_role {
    role_arn = "arn:aws:iam::622585044388:role/OrganizationAccountAccessRole"
  }
}

terraform {
  backend "http" {
  }
}


module "idp" {
  source = "git::http://git@gitlab.com/commons-acp/terraform/aws/cognito?ref=v1.0.8"
  app_name= var.app_name
  logout_urls= var.logout_urls
  callback_urls= var.callback_urls

  //  if facebook_client_id is empty , this module will not create provider facebook
  facebook_client_secret=var.facebook_client_secret
  facebook_client_id=var.facebook_client_id
  facebook_api_version=var.facebook_api_version

  email_confirmation_body="Please click the link below to verify your email address. {##Verify Email##} "
  email_confirmation_subject= "ANKAN Verification link"
  amazoncognito_name="ankan"
  identity_pool_name=var.identity_pool_name
  upload_bucket_name=var.upload_bucket_name
  aws_region= "eu-west-1"
  providers = {
    aws = aws.main
  }
}
