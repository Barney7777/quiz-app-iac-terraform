# request public certificates from the amazon certificate manager.
resource "aws_acm_certificate" "acm_certificate" {
  domain_name       = var.subdomain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}