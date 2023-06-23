output "app_certificate_arn" {
  value = aws_acm_certificate_validation.cert_app.certificate_arn
}
