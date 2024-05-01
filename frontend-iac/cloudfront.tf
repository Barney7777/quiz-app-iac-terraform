# CloudFront distribution with S3 origin, HTTPS redirect, IPv6 enabled, no cache, and ACM SSL certificate.
resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "${var.project_name}-${var.environment}-${var.environment}-${var.region}-OAC"
  description                       = "Allow Cloudfront access to s3"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


resource "aws_cloudfront_distribution" "s3_distribution" {
  depends_on = [aws_s3_bucket.bucket]

  origin {
    domain_name              = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    origin_id                = "S3-${var.project_name}-${var.domain_name}-${var.environment}"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  comment             = "cloudfront distribution for ${var.project_name}-${var.environment}"
  aliases             = [var.domain_name, var.sub_domain_name]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.project_name}-${var.domain_name}-${var.environment}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = aws_acm_certificate.cert.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  price_class = "PriceClass_200"

  tags = {
    Name = var.project_name
  }
}

# Output the CloudFront distribution URL using the domain name of the cdn_static_website resource.
# output "cloudfront_url" {
#   value = aws_cloudfront_distribution.s3_distribution.domain_name
# }
