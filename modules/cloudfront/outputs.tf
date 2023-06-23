output "cf_domain_name" {
  value = concat(
  aws_cloudfront_distribution.main-lambda-edge.*.domain_name,
  aws_cloudfront_distribution.main.*.domain_name,
  )[0]
}

output "cf_hosted_zone_id" {
  value = concat(
  aws_cloudfront_distribution.main-lambda-edge.*.hosted_zone_id,
  aws_cloudfront_distribution.main.*.hosted_zone_id,
  )[0]
}

