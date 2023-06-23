#####API DEV
resource "aws_acm_certificate" "cert_api" {
  provider          = aws.cloudfront
  domain_name       = var.api_subdomain
  validation_method = "DNS"
}

resource "aws_route53_record" "cert_validation_api" {
  provider = aws.cloudfront
  name     = aws_acm_certificate.cert_api.domain_validation_options.0.resource_record_name
  type     = aws_acm_certificate.cert_api.domain_validation_options.0.resource_record_type
  zone_id  = var.zone_id
  records  = [aws_acm_certificate.cert_api.domain_validation_options.0.resource_record_value]
  ttl      = 60
}

resource "aws_acm_certificate_validation" "cert_api" {
  provider                = aws.cloudfront
  certificate_arn         = aws_acm_certificate.cert_api.arn
  validation_record_fqdns = [aws_route53_record.cert_validation_api.fqdn]
}
resource "aws_api_gateway_domain_name" "api_domain" {
  certificate_arn = aws_acm_certificate_validation.cert_api.certificate_arn
  domain_name     = aws_acm_certificate.cert_api.domain_name
}

resource "aws_route53_record" "r53_record_api" {
  name    = aws_api_gateway_domain_name.api_domain.domain_name
  type    = "A"
  zone_id = var.zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.api_domain.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.api_domain.cloudfront_zone_id
  }
}
