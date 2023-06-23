terraform {
  backend "http" {}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "2.26.0"
    }
  }
}

provider "aws" {
  alias = "acm"
  region = "us-east-1"
  assume_role {
    role_arn = var.provider_env_roles
  }
}


module "acm" {
  source = "git::ssh://git@gitlab.com/aws-atn-grp/tf-modules.git//atn-commons/acm-certificate?ref=v1.0.8"
  domain = var.api_subdomain
  providers = {
    aws.acm = aws.acm
  }
}
