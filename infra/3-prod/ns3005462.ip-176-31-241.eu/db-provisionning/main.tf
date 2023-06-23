

provider "mongodb" {
  host = var.mongo_host
  port = data.terraform_remote_state.databases.outputs.mongo_db_port
  username =  data.terraform_remote_state.databases.outputs.mongo_db_admin_usr
  password = data.terraform_remote_state.databases.outputs.mongo_db_admin_pwd
  auth_database = "admin"
}
terraform {
  backend "http" {
  }
  required_providers {
    mongodb = {
      source = "Kaginari/mongodb"
      version = "0.0.4"
    }
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
module "mongodb" {
  source = "git::ssh://git@gitlab.com/commons-acp/terraform/mongodb/client-mongo?ref=v1.0.2"
  mongo_db_pwd = var.mongo_db_pwd
  mongo_db_user = var.mongo_db_user
  providers = {
    mongodb = mongodb
  }
}
