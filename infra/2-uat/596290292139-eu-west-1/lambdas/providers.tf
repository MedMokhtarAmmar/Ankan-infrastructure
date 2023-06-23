provider "aws" {
  region = "eu-west-1"
  version = "2.70.0"
  alias = "main"
  assume_role {
    role_arn = "arn:aws:iam::596290292139:role/OrganizationAccountAccessRole"
  }
}
data terraform_remote_state "roles"{
  backend = "s3"
  config = {
    bucket = "atn-tfstates"
    key    = "fondation/live/prod/aws/04-uat-596290292139/roles.tfstate"
    region = "eu-west-1"
  }
}




