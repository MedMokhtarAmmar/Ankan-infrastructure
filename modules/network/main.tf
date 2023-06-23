provider "aws" {
  region     = var.aws_region

}
# AWS Region for S3 and other resources
provider "aws" {
  region     = var.aws_region
  alias = "main"
}

# AWS Region for Cloudfront (ACM certs only supports us-east-1)
provider "aws" {
  region     = "us-east-1"
  alias = "cloudfront"
}
