provider "aws" {

}


data terraform_remote_state "roles"{
  backend = "s3"

  config = {
    bucket = var.tfstates_bucket
    key = var.tfstates_roles_key
    region = var.aws_region
  }
}
