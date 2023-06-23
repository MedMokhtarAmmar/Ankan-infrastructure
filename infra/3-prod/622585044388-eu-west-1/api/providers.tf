provider "aws" {
  region     = "eu-west-1"
  version = "2.70.0"
  assume_role {
    role_arn = "arn:aws:iam::622585044388:role/OrganizationAccountAccessRole"
  }
}
