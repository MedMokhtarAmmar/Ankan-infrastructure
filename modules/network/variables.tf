#fondation
variable "tfstates_bucket" {
  description = "TF states buckets"
}

variable "aws_region" {
  description = "AWS region"
}

# front
variable "front_subdomain" {
  description = "The front subdomain"
}


#API
variable "api_subdomain" {
  description = "The api subdomain"
}


variable "zone_id" {
  description = "the zone id"
}
