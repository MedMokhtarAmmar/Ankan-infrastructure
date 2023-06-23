
# ACM Certificate generation
resource "aws_acm_certificate" "cert_app" {
  provider          = aws.cloudfront
  domain_name       = var.front_subdomain
  validation_method = "DNS"
}
resource "aws_acm_certificate_validation" "cert_app" {
  provider                = aws.cloudfront
  certificate_arn         = aws_acm_certificate.cert_app.arn
  validation_record_fqdns = [aws_route53_record.cert_validation_app.fqdn]
}

resource "aws_route53_record" "cert_validation_app" {
  provider = aws.cloudfront
  name     = aws_acm_certificate.cert_app.domain_validation_options.0.resource_record_name
  type     = aws_acm_certificate.cert_app.domain_validation_options.0.resource_record_type
  zone_id  = var.zone_id
  records  = [aws_acm_certificate.cert_app.domain_validation_options.0.resource_record_value]
  ttl      = 60
}
