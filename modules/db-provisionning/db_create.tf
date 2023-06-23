
resource "null_resource" "create_ankan_db" {
  triggers = {
    mongo_db_name=var.mongo_db_name
    mongo_db_role=var.mongo_db_role
    mongo_db_user=var.mongo_db_user
    mongo_db_pwd=var.mongo_db_pwd
    server_ip = data.terraform_remote_state.network_allence.outputs.server_ip
    mongo_db_port = data.terraform_remote_state.databases.outputs.mongo_db_port
    mongo_db_admin_usr = data.terraform_remote_state.databases.outputs.mongo_db_admin_usr
    mongo_db_admin_pwd = data.terraform_remote_state.databases.outputs.mongo_db_admin_pwd
  }

  provisioner "local-exec" {
    when = create
    command = <<EOF
    mongo  admin --host ${self.triggers.server_ip} --port ${self.triggers.mongo_db_port} -u ${self.triggers.mongo_db_admin_usr} -p ${self.triggers.mongo_db_admin_pwd} <<EOF
    use ${self.triggers.mongo_db_name};
    db.createRole({
    role: '${self.triggers.mongo_db_role}',
    privileges: [
    {
    resource: { db: "${self.triggers.mongo_db_name}", collection: ""},
    actions: [ "collStats", "dbHash", "dbStats", "find", "killCursors", "listIndexes", "listCollections", "convertToCapped", "createCollection", "createIndex", "dropIndex", "insert", "remove", "renameCollectionSameDB", "update"]} ],
    roles: []
    });
    use ${self.triggers.mongo_db_name};
    db.createUser({user: '${self.triggers.mongo_db_user}', pwd: '${self.triggers.mongo_db_pwd}', roles: [{role: '${self.triggers.mongo_db_role}', db: '${self.triggers.mongo_db_name}'}]});

    EOF
  }

}

