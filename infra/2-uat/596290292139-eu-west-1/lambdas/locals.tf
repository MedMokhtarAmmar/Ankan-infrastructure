locals {
  mongo_usr=var.mongo_usr
  mongo_pwd= var.mongo_pwd
  host= var.host
  mongo_port= var.mongo_port
  mongo_db= var.mongo_db
  lambda_env = {MONGO_URI = "mongodb://${local.mongo_usr}:${local.mongo_pwd}@${local.host}:${local.mongo_port}/${local.mongo_db}" } // the connection path of mongo to lambda function
}
