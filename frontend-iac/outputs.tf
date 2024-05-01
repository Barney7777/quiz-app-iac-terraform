output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}
output "domain_name" {
  value = var.domain_name
}

output "subdomain_name" {
  value = var.sub_domain_name
}

output "frontend_url" {
  value = join("", ["https://", var.record_name, ".", var.domain_name])
}