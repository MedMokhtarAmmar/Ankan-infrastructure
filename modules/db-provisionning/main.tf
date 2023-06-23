provider "null" {
}

provider "aws" {
}




data terraform_remote_state "network_allence" {
  backend = "s3"
  config = {
    bucket = var.tfstates_bucket
    key = var.tfstates_network_allence_key
    region = var.aws_region
  }
}


data terraform_remote_state "databases" {
  backend = "s3"
  config = {
    bucket = var.tfstates_bucket
    key = var.tfstates_databases_key
    region = var.aws_region
  }
}
