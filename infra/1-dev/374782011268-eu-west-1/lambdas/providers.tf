provider "aws" {
  region = "eu-west-1"
  version = "2.70.0"
  alias = "main"
  assume_role {
    role_arn = "arn:aws:iam::374782011268:role/OrganizationAccountAccessRole"
  }
}
//data terraform_remote_state "databases" {
//  backend = "s3"
//  config = {
//    bucket = "atn-tfstates"
//    key = "ns3367653.ip-37-187-79.eu/projets/aws-allence-tn/administration/databases.tfstate"
//    region = "eu-west-1"
//  }
//}
//data terraform_remote_state "data-dev"{
//  backend = "s3"
//  config = {
//    bucket = "atn-tfstates"
//    key = "ns3367653.ip-37-187-79.eu/projets/ankan/db-provisionning-dev.tfstate"
//    region = "eu-west-1"
//  }
//}
//
data terraform_remote_state "roles"{
  backend = "s3"
  config = {
    bucket = "atn-tfstates"
    key    = "fondation/live/prod/aws/02-develop-374782011268/roles.tfstate"
    region = "eu-west-1"
  }
}
//
//data terraform_remote_state "network_allence" {
//  backend = "s3"
//  config = {
//    bucket  = "atn-tfstates"
//    key     = "ns3367653.ip-37-187-79.eu/projets/aws-allence-tn/network.tfstate"
//    region  = "eu-west-1"
//  }
//}



