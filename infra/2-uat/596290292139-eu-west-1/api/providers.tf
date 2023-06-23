provider "aws" {
  region     = "eu-west-1"
  version = "2.70.0"
  assume_role {
    role_arn = "arn:aws:iam::596290292139:role/OrganizationAccountAccessRole"
  }
}
