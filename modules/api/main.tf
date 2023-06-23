provider "aws" {
}

terraform {
  backend "s3" {
  }
}



data terraform_remote_state "lambdas"{
  backend = "s3"

  config = {
    bucket = var.tfstates_bucket
    key = var.tfstates_lambdas_key
    region = var.aws_region
  }
}

data terraform_remote_state "idp"{
  backend = "s3"

  config = {
    bucket = var.tfstates_bucket
    key = var.tfstates_idp_key
    region = var.aws_region
  }
}
