terraform {
  extra_arguments "common_vars_plan" {
    commands = [
      "plan","run-all plan","import"]
    arguments = [

    ]
  }
  extra_arguments "common_vars_autoapprouve" {
    commands = [
      "apply"]

    arguments = [
      "-auto-approve"
    ]
  }
  extra_arguments "common_vars_autoapprouve" {
    commands = [
      "destroy"]

    arguments = [
      "-auto-approve"
    ]
  }
}

remote_state {
  backend = "http"
  config = {
    address = "https://gitlab.com/api/v4/projects/21268142/terraform/state/${replace(replace(path_relative_to_include(), ".", "-"), "/", "_")}.tfstate"
    retry_wait_min = "5"
    username = "username"
    password =  get_env("gitlab_token")
  }
}

