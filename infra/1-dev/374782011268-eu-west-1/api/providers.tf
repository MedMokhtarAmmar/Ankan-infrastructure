provider "aws" {
  region     = "eu-west-1"
  version = "2.70.0"
  assume_role {
    role_arn = "arn:aws:iam::374782011268:role/OrganizationAccountAccessRole"
  }
}
