# Create S3 bucket to host statstic website
resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.domain_name}-${var.environment}"
  force_destroy = true # apply force destroy So, when going to destroy it won't throw error 'Bucket is not empty'
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = "${var.project_name}-${var.environment}-s3"
  }
}

# unable versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownership_controls]
  bucket     = aws_s3_bucket.bucket.id
  acl        = "private"
}

# Keeping S3 bucket private
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

data "aws_caller_identity" "current" {

}

# This Terraform code defines an IAM policy document that allows CloudFront to access objects in the S3 bucket
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"]
    }
  }
}

# Creating the S3 policy and applying it for the S3 bucket
resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}


