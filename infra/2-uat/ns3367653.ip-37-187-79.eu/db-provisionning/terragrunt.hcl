

include {
  path = find_in_parent_folders()
}

inputs = {
  mongo_db_pwd                 = "all0.1EN2.3ce"
  mongo_db_user                = "ankan-user"
  tfstates_databases_key      = "ns3367653.ip-37-187-79.eu/projets/aws-allence-tn/administration/databases.tfstate"
  aws_region                  = "eu-west-1"
  tfstates_bucket             = "atn-tfstates"
  mongo_host                  = "ns3367653.ip-37-187-79.eu"

}
