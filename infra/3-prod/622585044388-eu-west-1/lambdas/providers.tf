provider "aws" {
  region = "eu-west-1"
  version = "2.70.0"
  alias = "main"
  assume_role {
    role_arn = "arn:aws:iam::622585044388:role/OrganizationAccountAccessRole"
  }
}
data terraform_remote_state "roles"{
  backend = "s3"
  config = {
    bucket = "atn-tfstates"
    key    = "fondation/live/prod/aws/05-prod-622585044388/roles.tfstate"
    region = "eu-west-1"
  }
}




