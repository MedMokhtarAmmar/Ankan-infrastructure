include {
  path = find_in_parent_folders()
}
dependency "mongo" {
  config_path = "../../ns3005462.ip-176-31-241.eu/db-provisionning"
}

inputs ={
  mongo_usr=dependency.mongo.outputs.mongo_user
  mongo_pwd= dependency.mongo.outputs.mongo_password
  host= dependency.mongo.outputs.mongo_host
  mongo_port= dependency.mongo.outputs.mongo_db_port
  mongo_db=  dependency.mongo.outputs.mongo_db_name
  aws_region                  = "eu-west-1"
  app_name                    = "ankan-prod"
  provider_env_roles          = "arn:aws:iam::622585044388:role/OrganizationAccountAccessRole"
  file_name                   = "back.zip"
  project_version             = "0.0.3"
}
