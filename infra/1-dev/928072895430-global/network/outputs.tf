output "api_domain" {
  value = var.api_subdomain
}
output "app_certificate_arn" {
  value = module.network.app_certificate_arn
}
