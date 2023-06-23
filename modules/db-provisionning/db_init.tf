//
//resource "null_resource" "init_db" {
//  depends_on = [null_resource.create_ankan_db]
//  provisioner "local-exec" {
//    when = create
//    command = <<EOF
//    mongorestore \
//    --host ${data.terraform_remote_state.network_allence.outputs.server_ip} \
//    --port ${data.terraform_remote_state.databases.outputs.mongo_db_port} \
//    --username ${data.terraform_remote_state.databases.outputs.mongo_db_admin_usr} \
//    --password ${data.terraform_remote_state.databases.outputs.mongo_db_admin_pwd} \
//    --authenticationDatabase admin \
//    --db ${var.mongo_db_name} ${var.database_init_path}
//    EOF
//  }
//
//}
//
