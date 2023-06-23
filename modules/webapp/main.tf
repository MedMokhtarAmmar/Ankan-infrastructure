provider "aws" {
  region = var.aws_region
  version = "2.26.0"
  alias = "main"
  assume_role {
    role_arn = var.provider_env_roles
  }
}
terraform {
  required_version = ">= 0.12.29"
}



data terraform_remote_state "idp" {
  backend = "s3"

  config = {
    bucket = var.tfstates_bucket
    key = var.tfstates_idp_key
    region = var.aws_region
  }
}
