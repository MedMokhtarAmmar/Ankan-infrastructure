provider "aws" {
  region     = var.aws_region
  version = "2.70.0"
  assume_role {
    role_arn = var.provider_env_roles
  }
}

