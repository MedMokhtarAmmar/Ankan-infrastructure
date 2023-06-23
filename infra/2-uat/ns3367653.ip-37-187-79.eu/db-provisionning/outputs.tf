

output "mongo_user" {
  value = var.mongo_db_user
}
output "mongo_password" {
  value = var.mongo_db_pwd
}
output "mongo_host" {
  value = var.mongo_host
}
output "mongo_db_name" {
  value = module.mongodb.mongo_db_name
}

output "mongo_db_port" {
  value = data.terraform_remote_state.databases.outputs.mongo_db_port
}
