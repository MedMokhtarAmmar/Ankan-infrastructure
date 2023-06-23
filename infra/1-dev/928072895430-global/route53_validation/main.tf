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
  region = "eu-west-1"
}
data terraform_remote_state "domains"{
  backend = "s3"

  config = {
    bucket = var.tfstates_bucket
    key = var.tfstates_domains_key
    region = var.aws_region
  }
}
data "aws_route53_zone" "main" {
  name         = data.terraform_remote_state.domains.outputs.ankan_fr_name
  private_zone = false
}
module "r53_validation" {
  source = "git::ssh://git@gitlab.com/aws-atn-grp/tf-modules.git//atn-commons/route53_certificate_validation?ref=v1.0.8"
  acm_api_resource_record_type = var.acm_api_resource_record_type
  acm_api_resource_record_value = var.acm_api_resource_record_value
  api_acm_resource_record_name = var.api_acm_resource_record_name
  zone_id = data.aws_route53_zone.main.zone_id
  providers = {
    aws = aws
  }

}

