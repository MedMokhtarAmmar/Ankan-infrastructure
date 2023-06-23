provider "aws" {
  region = var.aws_region
}
# AWS Region for S3 and other resources
provider "aws" {
  region = var.aws_region
  alias = "main"
}

# AWS Region for Cloudfront (ACM certs only supports us-east-1)
provider "aws" {
  region = "us-east-1"
  alias = "cloudfront"
}
terraform {
  backend "http" {
  }
}
data terraform_remote_state "domains" {
  backend = "s3"

  config = {
    bucket = var.tfstates_bucket
    key = var.tfstates_domains_key
    region = var.aws_region
  }
}


data "aws_route53_zone" "main" {
  provider = aws.main
  name = data.terraform_remote_state.domains.outputs.ankan_fr_name
  private_zone = false
}
//data terraform_remote_state "network" {
  //backend = "s3"
  //config = {
    //bucket = var.tfstates_bucket
   // key = var.tfstates_network_key
  //  region = var.aws_region
 // }
//}

//data "terraform_remote_state" "acm" {
 //  backend = "s3"
  //config ={
   // bucket = var.tfstates_bucket
    //key = var.tfstates_acm_key
    //region = var.aws_region
 // }
//}




module "cloudfront" {
  source = "git::ssh://git@gitlab.com/aws-atn-grp/tf-modules.git//atn-commons/cloudfront?ref=v1.0.0"
  aws_region = var.aws_region
  single_page_application = true
  website_endpoint = var.website_endpoint
  fqdn = var.front_subdomain
  ssl_certificate_arn = var.ssl_certificate_arn
}
# Route 53 record for the static site
resource "aws_route53_record" "record_app" {
  provider = aws.main
  zone_id = data.aws_route53_zone.main.zone_id
  name = var.front_subdomain
  type = "A"

  alias {
    name = module.cloudfront.cf_domain_name
    zone_id = module.cloudfront.cf_hosted_zone_id
    evaluate_target_health = false
  }
}
