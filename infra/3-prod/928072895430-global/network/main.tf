provider "aws" {
  region     = var.aws_region
  version = "= 2.70.0"
}
# AWS Region for S3 and other resources
provider "aws" {
  region     = var.aws_region
  version = "= 2.70.0"
  alias = "main"
}

# AWS Region for Cloudfront (ACM certs only supports us-east-1)
provider "aws" {
  region     = "us-east-1"
  alias = "cloudfront"
  version = "= 2.70.0"

}
terraform {
  backend "http" {
  }
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
  provider     = aws.main
  name         = data.terraform_remote_state.domains.outputs.ankan_fr_name
  private_zone = false
}
module "network" {
  source = "git::ssh://git@gitlab.com/aws-atn-grp/tf-modules.git//atn-commons/network?ref=v1.0.8"
  tfstates_bucket = var.tfstates_bucket
  aws_region = var.aws_region
  front_subdomain = var.front_subdomain
  api_subdomain =  var.api_subdomain
  zone_id = data.aws_route53_zone.main.zone_id
  api_gateway_domain_name = var.api_gateway_domain_name
  api_gateway_zone_id = var.api_gateway_zone_id

  providers = {
    aws=aws
    aws.main=aws.main
  }

}
