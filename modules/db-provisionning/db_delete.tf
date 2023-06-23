resource "null_resource" "destroy_ankan_db" {
  triggers = {
    mongo_db_name = var.mongo_db_name
    mongo_db_role = var.mongo_db_role
    mongo_db_user = var.mongo_db_user
    server_ip = data.terraform_remote_state.network_allence.outputs.server_ip
    mongo_db_port = data.terraform_remote_state.databases.outputs.mongo_db_port
    mongo_db_admin_usr = data.terraform_remote_state.databases.outputs.mongo_db_admin_usr
    mongo_db_admin_pwd = data.terraform_remote_state.databases.outputs.mongo_db_admin_pwd
  }

  provisioner "local-exec" {
    when = destroy
    command = <<EOF
   mongo  admin --host ${self.triggers.server_ip} --port ${self.triggers.mongo_db_port} -u ${self.triggers.mongo_db_admin_usr} -p ${self.triggers.mongo_db_admin_pwd} <<EOF
    use ${self.triggers.mongo_db_name};
    db.dropRole('${self.triggers.mongo_db_role}');
    db.dropUser('${self.triggers.mongo_db_user}')
    db.dropDatabase();

    EOF
  }


}
