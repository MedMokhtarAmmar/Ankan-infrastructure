

variable "source_folder" {
  description = "The front source folder"

}
#project variable
variable "aws_region" {
  description = "AWS region"
}

variable "app_name" {
  description = "Application name"
}
# front
variable "allowed_ips" {
  default = [
    "0.0.0.0/0"            # public access
    # "xxx.xxx.xxx.xxx/mm" # restricted
    # "999.999.999.999/32" # invalid IP, completely inaccessible
  ]
}

variable "routing_rules" {
  type        = string
  description = "Routing rules for the S3 bucket"
  default     = ""
}
variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}


variable "refer_secret" {
  type        = string
  description = "A secret string to authenticate CF requests to S3"
  default     = "123-VERY-SECRET-123"
}
variable "api_subdomain" {
  description = "api subdomain or api invoke url"
}
variable "build_config_path" {
  description = "build_config_path"
}
variable "tfstates_bucket" {
  description = "tfstates_bucket"
}
variable "tfstates_idp_key" {
  description = "tfstates_idp_key"
}
variable "provider_env_roles" {
  description = "provider_env_roles"
}
